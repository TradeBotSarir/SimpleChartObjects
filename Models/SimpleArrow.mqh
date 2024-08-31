//+------------------------------------------------------------------+
//|                                                    SimpleArrow.mqh |
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
class SimpleArrow
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/
    //* Common Parameters
    string m_pref;
    string m_prefAfter;
    int m_width;
    bool m_selectable;
    bool m_selected;
    bool m_inBackground;
    bool m_hiddenInList;
    long m_chartID;
    int m_subWindow;
    long m_zOrder;
    // * Specific Parameters
    color m_buyColor;
    color m_sellColor;
    int m_buyCode;
    int m_sellCode;

    /*------------------------------------------- Methods -------------------------------------------*/

public:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    SimpleArrow();

    //* Destructor
    ~SimpleArrow();

    /*=========================================== put Arrow , Method One ===========================================*/
    void put(const datetime i_time, double i_value, int i_trendType, string i_name = "");

    /*------------------------------------------- Setters -------------------------------------------*/
    //* common setters
    void setPref(string i_pref) { m_pref = i_pref; }
    void setPrefAfter(string i_prefAfter) { m_prefAfter = i_prefAfter; }
    void setWidth(int i_width) { m_width = i_width; }
    void setSelectable(bool i_selectable) { m_selectable = i_selectable; }
    void setSelected(bool i_selected) { m_selected = i_selected; }
    void setInBackground(bool i_inBackground) { m_inBackground = i_inBackground; }
    void setHiddenInList(bool i_hiddenInList) { m_hiddenInList = i_hiddenInList; }
    void setChartID(long i_chartID) { m_chartID = i_chartID; }
    void setSubWindow(int i_subWindow) { m_subWindow = i_subWindow; }
    void setZOrder(long i_zOrder) { m_zOrder = i_zOrder; }

    //* Specific setters
    void setBuyColor(color i_buyColor) { m_buyColor = i_buyColor; }
    void setSellColor(color i_sellColor) { m_sellColor = i_sellColor; }
    void setBuyCode(int i_buyCode) { m_buyCode = i_buyCode; }
    void setSellCode(int i_sellCode) { m_sellCode = i_sellCode; }

    void setAllProperties(string i_pref, int i_width, color i_buyColor, color i_sellColor, int i_buyCode, int i_sellCode, bool i_inBackground, bool i_hiddenInList, string i_prefAfter, long i_chartID, int i_subWindow, long i_zOrder, bool i_selectable, bool i_selected)
    {
        m_pref = i_pref;
        m_width = i_width;
        m_buyColor = i_buyColor;
        m_sellColor = i_sellColor;
        m_buyCode = i_buyCode;
        m_sellCode = i_sellCode;
        m_inBackground = i_inBackground;
        m_hiddenInList = i_hiddenInList;
        m_prefAfter = i_prefAfter;
        m_chartID = i_chartID;
        m_subWindow = i_subWindow;
        m_zOrder = i_zOrder;
        m_selectable = i_selectable;
        m_selected = i_selected;
    }

    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
SimpleArrow::SimpleArrow()
{
    //* common setters
    m_pref = "sarir_";
    m_prefAfter = "_simpleArrow";
    m_width = 1;
    m_selectable = false;
    m_selected = false;
    m_inBackground = false;
    m_hiddenInList = true;
    m_chartID = 0;
    m_subWindow = 0;
    m_zOrder = 0;
    //* Specific setters
    m_buyColor = clrGreen;
    m_sellColor = clrRed;
    m_buyCode = 233;
    m_sellCode = 234;
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
SimpleArrow::~SimpleArrow() {

};

/**================================================================================================
 **                                      put
 *?  put Arrow , Method One
 ** input : datetime
 * uses just time to draw arrow
 *================================================================================================**/

void SimpleArrow::put(const datetime i_time, double i_value, int i_trendType, string i_name = "")
{

    // Set arrow properties based on signal type
    int arrowCode = 0;
    color arrowColor = clrBlack;
    ENUM_ARROW_ANCHOR arrow_anchor = ANCHOR_TOP;
    if (i_trendType == 1)
    {
        arrowCode = m_buyCode; // Up arrow code
        arrowColor = m_buyColor;
        arrow_anchor = ANCHOR_TOP;
    }
    else if (i_trendType == -1)
    {
        arrowCode = m_sellCode; // Down arrow code
        arrowColor = m_sellColor;
        arrow_anchor = ANCHOR_BOTTOM;
    }

    // Draw the arrow on the chart
    ObjectCreate(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJ_ARROW, m_subWindow, i_time, i_value);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_ANCHOR, arrow_anchor);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_ARROWCODE, arrowCode);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_COLOR, arrowColor);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_WIDTH, m_width);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_SELECTABLE, m_selectable);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_SELECTED, m_selected);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_BACK, m_inBackground);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_HIDDEN, m_hiddenInList);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_ZORDER, m_zOrder);
    ChartRedraw(m_chartID);
}