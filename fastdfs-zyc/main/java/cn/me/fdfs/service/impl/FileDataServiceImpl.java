package cn.me.fdfs.service.impl;


import cn.me.fdfs.service.BaseService;
import cn.me.fdfs.service.FileDataService;
import cn.me.fdfs.util.FastDFSException;
import cn.me.fdfs.util.FileUtils;
import cn.me.fdfs.vo.DownloadFileRecord;
import cn.me.fdfs.vo.ErrorCode;
import cn.me.fdfs.vo.Fdfs_file;
import org.apache.log4j.Logger;
import org.csource.common.MyException;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.TrackerClient;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 12-9-3
 * Time: 下午7:09
 * To change this template use File | Settings | File Templates.
 */
@Service
public class FileDataServiceImpl extends BaseService implements FileDataService {
    private InputStream is;
    private static Logger logger = Logger.getLogger(FileDataServiceImpl.class);

    public String uploadFile(MultipartFile file) {


        try {
            if (file == null || file.isEmpty()) {
                throw new FastDFSException(ErrorCode.FILE_ISNULL.CODE, ErrorCode.FILE_ISNULL.MESSAGE);
            }
            is = file.getInputStream();

            String fileName = FileUtils.toLocal(file.getOriginalFilename());
            // 返回路径
            String path = null;
            // 文件名后缀
            String suffix = FileUtils.getFilenameSuffix(fileName);

            TrackerClient tracker = new TrackerClient();
            StorageClient1 storageClient = new StorageClient1(tracker.getConnection(), null);


            // 读取流
            byte[] fileBuff = new byte[is.available()];
            is.read(fileBuff, 0, fileBuff.length);

            // 上传
            path = storageClient.upload_file1(fileBuff, suffix, null);

            if (null == path || "".equals(path)) {
                throw new FastDFSException(ErrorCode.FILE_UPLOAD_FAILED.CODE, ErrorCode.FILE_UPLOAD_FAILED.MESSAGE);
            }


            if (logger.isDebugEnabled()) {
                logger.debug("upload file success, return path is {" + path + "}");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭流
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }


    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Fdfs_file> getFileListByGroupName(String groupName) {
        List<Fdfs_file> files = new ArrayList<Fdfs_file>();
        Session session = getSession();

        StringBuilder queryString = new StringBuilder(
                "from Fdfs_file as f where  f.file_id like '" + groupName + "%'");
        Query query = session.createQuery(queryString.toString());
        files = query.list();

        return files;
    }


    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public DownloadFileRecord getDownloadFileRecordByIpAndFileId(String ip, String fileId) {
        DownloadFileRecord downloadFileRecord=new DownloadFileRecord();
        Session session = getSession();
        StringBuilder queryString = new StringBuilder("  from DownloadFileRecord df where df.src_ip='"+ip+"' and df.fileId='"+fileId+"'");
        Query query = session.createQuery(queryString.toString());
          List<DownloadFileRecord> list=query.list();
        if(list.isEmpty()){
            return null;
        }else {
            return list.get(0);
        }

    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void saveDF(DownloadFileRecord downloadFileRecord) {
        Session session = getSession();
        session.saveOrUpdate(downloadFileRecord);
    }


}
