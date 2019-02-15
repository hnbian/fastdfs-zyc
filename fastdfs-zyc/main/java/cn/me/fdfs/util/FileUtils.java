package cn.me.fdfs.util;

import org.apache.log4j.Logger;

/**
 * 文件相关工具类
 * @Author hnbian
 * @Description
 * @Date 2018/12/21 17:17
 **/
public class FileUtils {

    private static Logger logger = Logger.getLogger(FileUtils.class);
    /**路径分隔符*/
    public static final String SEPARATOR = "/";
    /**Point*/
    public static final String POINT = ".";

    /**
     * 转换路径中的 '\' 为 '/' <br>
     * 并把文件后缀转为小写
     *
     * @param path 路径
     * @return
     */
    public static String toLocal(String path) {
        if (null != path &&  !"".equals(path)) {
            path = path.replaceAll("\\\\", SEPARATOR);

            if (path.contains(POINT)) {
                String pre = path.substring(0, path.lastIndexOf(POINT) + 1);
                String suffix = path.substring(path.lastIndexOf(POINT) + 1).toLowerCase();
                path = pre + suffix;
            }
        }
        return path;
    }
    /**
     * 获取文件名称的后缀
     *
     * @param filename 文件名 或 文件路径
     * @return 文件后缀
     */
    public static String getFilenameSuffix(String filename) {
        String suffix = null;
        String originalFilename = filename;
        if (null != filename && !"".equals(filename)) {
            if (filename.contains(SEPARATOR)) {
                filename = filename.substring(filename.lastIndexOf(SEPARATOR) + 1);
            }
            if (filename.contains(POINT)) {
                suffix = filename.substring(filename.lastIndexOf(POINT) + 1);
            } else {
                logger.error("filename error without suffix : {"+originalFilename+"}");
            }
        }
        return suffix;
    }

}
