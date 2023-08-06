package com.gin.util;

import java.util.ArrayList;
import java.util.List;

public class PageInfo {

    /**
     * total pages
     */
    private long totalPages;
    /**
     * total number of rows
     */
    private long totalRows;
    /**
     * current page
     */
    private long currentPage;

    /**
     * Length per page
     */
    private long pageSize;

    /**
     * url rules, can be customized such as: userlist/{page}
     */
    private String urlRule;

    public PageInfo() {}

    /**
     * Write pagination information
     * @param totalPages total pages
     * @param totalRows total number of rows
     * @param currentPage current page
     * @param urlRule The url rule can be customized, such as: userlist/{page}, the system uses the parameter form by default to write page={page}
     */
    public PageInfo(long totalPages, long totalRows, long currentPage, String urlRule) {
        this.totalPages = totalPages;
        this.totalRows = totalRows;
        this.currentPage = currentPage;
        this.urlRule = urlRule;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * Determine whether there is a previous page
     * @return
     */
    public boolean IsPrev() {
        return currentPage > 1;
    }

    /**
     * Get the URL of the previous page
     * @return String
     */
    public String getPrevPage() {
        if (IsPrev()) {
            return getUrlPath(currentPage - 1);
        }
        return "";
    }

    /**
     * Is there a next page
     * @return
     */
    public boolean IsNext() {
        return currentPage < totalPages;
    }

    /**
     * Get the URL address of the next page
     * @return
     */
    public String getNextPage() {
        if (IsNext()) {
            return getUrlPath(currentPage + 1);
        }
        return "";
    }

    /**
     * Get first page URL
     * @return
     */
    public String getFirstPage() {
        return getUrlPath(1);
    }

    /**
     * Get last page URL
     * @return
     */
    public String getLastPage() {
        return getUrlPath(totalPages);
    }

    /**
     * Get the page number list: the entity class is PageNumsPojo
     * @return List<PageNumsPojo>
     */
    public List<PageNumsPojo> getPageNums() {
        // 取回页码
        long rollPage = 2;
        long show_nums = rollPage * 2 + 1;
        long i = 0;
        long start = 0, end = 0;
        List<PageNumsPojo> result = new ArrayList();
        if (totalPages < show_nums) {
            start = 1;
            end = totalPages;
        } else if (currentPage < (1 + rollPage)) {
            start = 1;
            end = show_nums;
        } else if (currentPage >= (totalPages - rollPage)) {
            start = totalPages - show_nums;
            end = totalPages;
        } else {
            start = currentPage - rollPage;
            end = currentPage + rollPage;
        }
        for (i = start; i <= end; i++) {
            PageNumsPojo pojo = new PageNumsPojo();
            pojo.page = i;
            pojo.url = getUrlPath(i);
            result.add(pojo);
        }
        return result;
    }

    public class PageNumsPojo {

        private long page;
        private String url;

        public long getPage() {
            return page;
        }

        public void setPage(long page) {
            this.page = page;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }
    }

    /**
     * Get the total number of pages
     * @return
     */
    public long getTotalPages() {
        return totalPages;
    }

    /**
     * Set the total number of pages
     * @param totalPages
     */
    public void setTotalPages(long totalPages) {
        this.totalPages = totalPages;
    }

    /**
     * Get the total number of rows
     * @return
     */
    public long getTotalRows() {
        return totalRows;
    }

    /**
     * Set the total number of rows
     * @param totalRows
     */
    public void setTotalRows(long totalRows) {
        this.totalRows = totalRows;
    }

    /**
     * get current page
     * @return
     */
    public long getCurrentPage() {
        return currentPage;
    }

    /**
     * set current page
     * @param currentPage
     */
    public void setCurrentPage(long currentPage) {
        this.currentPage = currentPage;
    }

    /**
     * Get URL Rules
     * @return
     */
    public String getUrlRule() {
        return urlRule;
    }

    /**
     * Set up URL rules
     * @param urlRule
     */
    public void setUrlRule(String urlRule) {
        this.urlRule = urlRule;
    }

    /**
     * Get the page number of the successful replacement
     * @param page
     * @return
     */
    protected String getUrlPath(long page) {
        return urlRule.replace("{page}", String.valueOf(page));
    }
}
