package tw.FunBar.util;

import java.io.Serializable;

public class JSONFileUpload implements Serializable {
    private static final long serialVersionUID = 1L;
    private String path;
    
    public JSONFileUpload() {
        
    }
    
    public JSONFileUpload(String path) {
        this.path = path;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    
    
}
