package com.gin.util;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

//import sun.misc.BASE64Decoder;

/**
 * UEditor file upload auxiliary class
 *
 */
public class Uploader {

    // Output file address
    private String url = "";
    // upload file name
    private String fileName = "";
    // state
    private String state = "";
    // file type
    private String type = "";
    // original file name
    private String originalName = "";
    // File size
    private long size = 0;

    private HttpServletRequest request = null;
    private String title = "";

    // save route
    private String savePath = "upload";
    // file format allowed
    private String[] allowFiles = { ".rar", ".doc", ".docx", ".zip", ".pdf", ".txt", ".swf", ".wmv", ".gif", ".png", ".jpg", ".jpeg", ".bmp" };
    // File size limit, unit KB
    private int maxSize = 10000;

    private HashMap<String, String> errorInfo = new HashMap<String, String>();

    public Uploader(HttpServletRequest request) {
        this.request = request;
        HashMap<String, String> tmp = this.errorInfo;
        tmp.put("SUCCESS", "SUCCESS"); //Success by default
        tmp.put("NOFILE", "Does not contain file upload domain");
        tmp.put("TYPE", "Not allowed file format");
        tmp.put("SIZE", "The file size exceeds the limit");
        tmp.put("ENTYPE", "Request type ENTYPE error");
        tmp.put("REQUEST", "Upload request exception");
        tmp.put("IO", "IO exception");
        tmp.put("DIR", "Failed to create directory");
        tmp.put("UNKNOWN", "Unknown error");
    }

    public void upload() throws Exception {
        boolean isMultipart = ServletFileUpload.isMultipartContent(this.request);
        if (!isMultipart) {
            this.state = this.errorInfo.get("NOFILE");
            return;
        }
        DiskFileItemFactory dff = new DiskFileItemFactory();
        String savePath = this.getFolder(this.savePath);
        dff.setRepository(new File(savePath));
        try {
            ServletFileUpload sfu = new ServletFileUpload(dff);

            sfu.setHeaderEncoding("utf-8");
            FileItemIterator fii = sfu.getItemIterator(this.request);
            while (fii.hasNext()) {
                FileItemStream fis = fii.next();
                if (!fis.isFormField()) {
                    this.originalName = fis.getName().substring(fis.getName().lastIndexOf(System.getProperty("file.separator")) + 1);
                    if (!this.checkFileType(this.originalName)) {
                        this.state = this.errorInfo.get("TYPE");
                        continue;
                    }
                    this.fileName = this.getName(this.originalName);
                    this.type = this.getFileExt(this.fileName);
                    this.url = savePath + "/" + this.fileName;
                    BufferedInputStream in = new BufferedInputStream(fis.openStream());
                    File file = new File(this.getPhysicalPath(this.url));
                    FileOutputStream out = new FileOutputStream(file);
                    BufferedOutputStream output = new BufferedOutputStream(out);
                    Streams.copy(in, output, true);

                    if (Info.localUploadPath != null && !Info.localUploadPath.equals("")) {
                        String sp = savePath.replace("../../../", "");
                        if (sp.substring(0, 1).equals("/")) {
                            sp = sp.substring(1);
                        }
                        String localUrl = Info.localUploadPath + "/" + sp + "/" + this.fileName;
                        File localFile = new File(localUrl);
                        copyFile(file, localFile);
                    }

                    this.state = this.errorInfo.get("SUCCESS");
                    this.size = file.length();
                    break;
                } else {
                    String fname = fis.getFieldName();
                    if (!fname.equals("pictitle")) {
                        continue;
                    }
                    BufferedInputStream in = new BufferedInputStream(fis.openStream());
                    BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                    StringBuffer result = new StringBuffer();
                    while (reader.ready()) {
                        result.append((char) reader.read());
                    }
                    this.title = new String(result.toString().getBytes(), "utf-8");
                    reader.close();
                }
            }
        } catch (SizeLimitExceededException e) {
            this.state = this.errorInfo.get("SIZE");
        } catch (InvalidContentTypeException e) {
            this.state = this.errorInfo.get("ENTYPE");
        } catch (FileUploadException e) {
            this.state = this.errorInfo.get("REQUEST");
        } catch (Exception e) {
            this.state = this.errorInfo.get("UNKNOWN");
        }
    }

    public static void copyFile(File source, File dest) throws IOException {
        InputStream input = null;
        OutputStream output = null;
        try {
            input = new FileInputStream(source);
            output = new FileOutputStream(dest);
            byte[] buf = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buf)) != -1) {
                output.write(buf, 0, bytesRead);
            }
        } finally {
            input.close();
            output.close();
        }
    }

    /**
     * File type judgment
     *
     * @param fileName
     * @return
     */
    private boolean checkFileType(String fileName) {
        return true;
    }

    /**
     * Get the file extension
     *
     * @return string
     */
    private String getFileExt(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }

    /**
     * Generate a new file name based on the original file name
     * @return
     */
    private String getName(String fileName) {
        Random random = new Random();
        return this.fileName = "" + random.nextInt(10000) + System.currentTimeMillis() + this.getFileExt(fileName);
    }

    /**
     * Create a local directory according to the string and create a subdirectory according to the date go back
     * @param path
     * @return
     */
    private String getFolder(String path) {
        SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
        path += "/" + formater.format(new Date());
        File dir = new File(this.getPhysicalPath(path));
        if (!dir.exists()) {
            try {
                dir.mkdirs();
            } catch (Exception e) {
                this.state = this.errorInfo.get("DIR");
                return "";
            }
        }
        return path;
    }

    /**
     * Get the physical path according to the incoming virtual path
     *
     * @param path
     * @return
     */
    private String getPhysicalPath(String path) {
        String servletPath = this.request.getServletPath();
        String realPath = this.request.getSession().getServletContext().getRealPath(servletPath);
        return new File(realPath).getParent() + "/" + path;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public void setAllowFiles(String[] allowFiles) {
        this.allowFiles = allowFiles;
    }

    public void setMaxSize(int size) {
        this.maxSize = size;
    }

    public long getSize() {
        return this.size;
    }

    public String getUrl() {
        return this.url;
    }

    public String getFileName() {
        return this.fileName;
    }

    public String getState() {
        return this.state;
    }

    public String getTitle() {
        return this.title;
    }

    public String getType() {
        return this.type;
    }

    public String getOriginalName() {
        return this.originalName;
    }
}
