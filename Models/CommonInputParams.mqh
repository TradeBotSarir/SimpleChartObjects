//+------------------------------------------------------------------+
//|                                                    CommonInputParams.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *  This class
 *================================================================================================**/

/*=========================================== Includes ===========================================*/

/*=========================================== class ===========================================*/
class CommonInputParams {
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/
   protected:
   public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    //* Common Parameters
    string m_symbol;
    ENUM_TIMEFRAMES m_timeFrame;
    string m_pref;
    string m_prefAfter;
    bool m_selectable;
    bool m_selected;
    bool m_inBackground;
    bool m_hiddenInList;
    long m_chartID;
    int m_subWindow;
    long m_zOrder;
    string m_fullName;
    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    CommonInputParams();

    //* Destructor
    ~CommonInputParams();

    //* Copy Constructor
    CommonInputParams(const CommonInputParams &i_commonInputParams) {
        m_pref = i_commonInputParams.m_pref;
        m_prefAfter = i_commonInputParams.m_prefAfter;
        m_selectable = i_commonInputParams.m_selectable;
        m_selected = i_commonInputParams.m_selected;
        m_inBackground = i_commonInputParams.m_inBackground;
        m_hiddenInList = i_commonInputParams.m_hiddenInList;
        m_chartID = i_commonInputParams.m_chartID;
        m_subWindow = i_commonInputParams.m_subWindow;
        m_zOrder = i_commonInputParams.m_zOrder;
    }
    /*------------------------------------------- Getters -------------------------------------------*/
    string getFullName() { return m_fullName; }
    /*------------------------------------------- Setters -------------------------------------------*/
    //* common setters
    void setSymbol(string i_symbol) { m_symbol = i_symbol; }
    void setTimeFrame(ENUM_TIMEFRAMES i_timeFrame) { m_timeFrame = i_timeFrame; }
    void setPref(string i_pref) { m_pref = i_pref; }
    void setPrefAfter(string i_prefAfter) { m_prefAfter = i_prefAfter; }
    void setSelectable(bool i_selectable) { m_selectable = i_selectable; }
    void setSelected(bool i_selected) { m_selected = i_selected; }
    void setInBackground(bool i_inBackground) { m_inBackground = i_inBackground; }
    void setHiddenInList(bool i_hiddenInList) { m_hiddenInList = i_hiddenInList; }
    void setChartID(long i_chartID) { m_chartID = i_chartID; }
    void setSubWindow(int i_subWindow) { m_subWindow = i_subWindow; }
    void setZOrder(long i_zOrder) { m_zOrder = i_zOrder; }
    //* Set Common Parameters
    void setCommpnParams(CommonInputParams &i_commonInputParams) {
        m_pref = i_commonInputParams.m_pref;
        m_prefAfter = i_commonInputParams.m_prefAfter;
        m_selectable = i_commonInputParams.m_selectable;
        m_selected = i_commonInputParams.m_selected;
        m_inBackground = i_commonInputParams.m_inBackground;
        m_hiddenInList = i_commonInputParams.m_hiddenInList;
        m_chartID = i_commonInputParams.m_chartID;
        m_subWindow = i_commonInputParams.m_subWindow;
        m_zOrder = i_commonInputParams.m_zOrder;
        m_chartID = i_commonInputParams.m_chartID;
    }
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
CommonInputParams::CommonInputParams() {
    //* common setters
    m_pref = "sarir_";
    m_prefAfter = "_simpleObject";
    m_selectable = false;
    m_selected = false;
    m_inBackground = false;
    m_hiddenInList = true;
    m_chartID = 0;
    m_subWindow = 0;
    m_zOrder = 0;
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
CommonInputParams::~CommonInputParams() {

};
