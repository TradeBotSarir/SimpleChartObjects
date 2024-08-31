//+------------------------------------------------------------------+
//|                                                    SimpleHorizontalArrow.mqh |
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
class SimpleHorizontalArrow
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
    color m_color;
    bool m_leftToRight;
    int m_lengthIndex;

    /*------------------------------------------- Methods -------------------------------------------*/

public:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    SimpleHorizontalArrow();

    //* Destructor
    ~SimpleHorizontalArrow();

    /*=========================================== put horizontal Arrow , Method One ===========================================*/
    void put(const datetime i_time, double i_value, string i_name = "");

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
    void setColor(color i_color) { m_color = i_color; }

    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
SimpleHorizontalArrow::SimpleHorizontalArrow()
{
    //* common setters
    m_pref = "sarir_";
    m_prefAfter = "_SimpleHorizontalArrow";
    m_width = 1;
    m_selectable = false;
    m_selected = false;
    m_inBackground = false;
    m_hiddenInList = true;
    m_chartID = 0;
    m_subWindow = 0;
    m_zOrder = 0;
    //* Specific setters
    m_color = clrBlack;
    m_leftToRight = true;
    m_lengthIndex = 5;
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
SimpleHorizontalArrow::~SimpleHorizontalArrow() {

};

/**================================================================================================
 **                                      put
 *?  put horizontal Arrow , Method One
 ** input : datetime
 * uses just time to draw arrow
 *================================================================================================**/

void SimpleHorizontalArrow::put(const datetime i_time, double i_value, string i_name = "")
{
    datetime time2;
    if (m_leftToRight)
    {
        time2 = i_time + m_lengthIndex * PeriodSeconds();
    }
    else
    {
        time2 = i_time - m_lengthIndex * PeriodSeconds();
    }
    // Draw the horizontal arrow on the chart
    ObjectCreate(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJ_ARROWED_LINE, m_subWindow, i_time, i_value, time2, i_value);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_COLOR, m_color);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_WIDTH, m_width);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_SELECTABLE, m_selectable);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_SELECTED, m_selected);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_BACK, m_inBackground);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_HIDDEN, m_hiddenInList);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time) + i_name, OBJPROP_ZORDER, m_zOrder);
    ChartRedraw(m_chartID);
}