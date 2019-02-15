package cn.me.fdfs.util;

/**
 * FastDFS 上传下载时可能出现的一些异常信息
 * @Author hnbian
 * @Description
 * @Date 2018/12/21 17:12
 **/
public class FastDFSException extends Exception{
    /**
     *
     */
    private static final long serialVersionUID = -6463691496090059912L;

    /**
     * 错误码
     */
    private String code;

    /**
     * 错误消息
     */
    private String message;

    public FastDFSException(){}

    public FastDFSException(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public FastDFSException(Throwable cause) {
        super(cause);
    }

    public FastDFSException(String code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
