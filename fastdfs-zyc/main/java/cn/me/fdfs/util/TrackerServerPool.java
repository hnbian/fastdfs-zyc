package cn.me.fdfs.util;

import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.apache.log4j.Logger;
import org.csource.common.MyException;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.TrackerServer;
import org.springframework.beans.factory.annotation.Value;

import java.io.IOException;

/**
 *  功能说明:TrackerServer 对象池
 *  author: haonan.bian
 *  date: 2019-02-15 16:03:39
 */
public class TrackerServerPool {
    private static Logger log = Logger.getLogger(TrackerServerPool.class);

    /**
     * TrackerServer 配置文件路径
     */
    //private static final String FASTDFS_CONFIG_PATH = "config/config.properties";
    private static final String FASTDFS_CONFIG_PATH = Tools.getClassPath() + "config.properties";


    /**
     * 最大连接数 default 8.
     */
    @Value("${max_storage_connection}")
    private static int maxStorageConnection;

    /**
     * TrackerServer 对象池.
     * GenericObjectPool 没有无参构造
     */
    private static GenericObjectPool<TrackerServer> trackerServerPool;

    private TrackerServerPool(){};

    private static synchronized GenericObjectPool<TrackerServer> getObjectPool(){
        if(trackerServerPool == null){
            try {
                // 加载配置文件
                ClientGlobal.initByProperties(FASTDFS_CONFIG_PATH);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (MyException e) {
                e.printStackTrace();
            }

            log.debug("ClientGlobal configInfo: {" + ClientGlobal.configInfo() + "}");

            // Pool配置
            GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
            poolConfig.setMinIdle(2);
            if(maxStorageConnection > 0){
                log.info("maxStorageConnection:"+maxStorageConnection);
                poolConfig.setMaxTotal(maxStorageConnection);
            }

            //trackerServerPool = new GenericObjectPool<>(new TrackerServerFactory(), poolConfig);
        }
        return trackerServerPool;
    }

    /**
     * 获取 TrackerServer
     * @return TrackerServer
     * @throws FastDFSException
     */
    public static TrackerServer borrowObject() throws FastDFSException {
        TrackerServer trackerServer = null;
        try {
            trackerServer = getObjectPool().borrowObject();
        } catch (Exception e) {
            e.printStackTrace();
            if(e instanceof FastDFSException){
                throw (FastDFSException) e;
            }
        }
        return trackerServer;
    }

    /**
     * 回收 TrackerServer
     * @param trackerServer 需要回收的 TrackerServer
     */
    public static void returnObject(TrackerServer trackerServer){

        getObjectPool().returnObject(trackerServer);
    }


}
