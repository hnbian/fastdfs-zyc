package cn.me.fdfs.action;

import cn.me.fdfs.service.FileDataService;
import cn.me.fdfs.service.MonitorService;
import cn.me.fdfs.util.FastDFSException;
import cn.me.fdfs.util.FileUtils;
import cn.me.fdfs.vo.ErrorCode;
import cn.me.fdfs.vo.Fdfs_file;
import cn.me.fdfs.vo.FileSize;
import cn.me.fdfs.vo.Group;
import org.apache.log4j.Logger;
import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.csource.fastdfs.StorageClient1;

import static cn.me.fdfs.util.FileUtils.toLocal;

/**
 * @Author hnbian
 * @Description 对文件的相关操作
 * @Date 2018/12/21 16:42
 **/
@Controller
@RequestMapping("/dataStructure")
public class FileDataAction {
    private static Logger logger = Logger.getLogger(FileDataAction.class);

    /**
     * 文件名称Key
     */
    private static final String FILENAME = "filename";
    @Autowired
    private MonitorService monitorService;
    @Autowired
    private FileDataService fileDataService;

    @RequestMapping("/fileData")
    public ModelAndView fileData() throws IOException, MyException {
        ModelAndView mv = new ModelAndView("dataStructure/fileData.jsp");
        List<Group> list = monitorService.listGroups();
        Map<String, FileSize> container = new HashMap<String, FileSize>();
        for (Group group : list) {
            List<Fdfs_file> files = fileDataService.getFileListByGroupName(group.getGroupName());
            FileSize sizes = new FileSize();
            for (Fdfs_file file : files) {
                if (file.getFileSize() >= 0 && file.getFileSize() < 30 * 1024) {
                    sizes.setMiniSmall(sizes.getMiniSmall() + 1);
                } else if (file.getFileSize() >= 30 * 1024 && file.getFileSize() < 100 * 1024) {
                    sizes.setSmall(sizes.getSmall() + 1);
                } else if (file.getFileSize() >= 100 * 1014 && file.getFileSize() < 500 * 1024) {
                    sizes.setMiddle(sizes.getMiddle() + 1);
                } else {
                    sizes.setLarge(sizes.getLarge() + 1);
                }
            }
            container.put(group.getGroupName(), sizes);
        }
        mv.addObject("fileYdm", list);
        mv.addObject("fileSizes", container);
        return mv;
    }

    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public String handleFormUpload(@RequestParam("file") MultipartFile file) throws IOException,
            MyException, FastDFSException {


        return null;


        //todo 上传逻辑
        /*ModelAndView mv = new ModelAndView("main/index.jsp");
        System.out.println("name：" + name);
        System.out.println("上传文件：" + file.getOriginalFilename());
        String f = null;

        return null;*/
    }





}
