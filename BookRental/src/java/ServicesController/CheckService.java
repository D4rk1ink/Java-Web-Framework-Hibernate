package ServicesController;




import java.sql.ResultSet;
import java.util.List;

public class CheckService {
    public static boolean isEmptyRow(ResultSet rs){
        if(rs != null){     
            try {
                rs.last();
                if(rs.getRow() != 0){
                    rs.first();
                    rs.previous();
                    return false;
                }
            } catch (Exception ex) {}
        }
        return true;
    }
    public static boolean isOneRow(ResultSet rs){
        if(rs != null){     
            try {
                rs.last();
                if(rs.getRow() == 1){
                    rs.first();
                    rs.previous();
                    return true;
                }
            } catch (Exception ex) {}
        }
        return false;
    }
    
    public static boolean isEmptyRow(List lt){
        if(lt == null) return true;
        return lt.isEmpty();
    }
    public static boolean isOneRow(List lt){
        if(lt == null) return false;
        return lt.size() == 1;
    }
}
