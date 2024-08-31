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
#include "CommonInputParams.mqh"
/*=========================================== class ===========================================*/
class SimpleHorizontalArrow : public CommonInputParams
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    // * Specific Parameters
    color m_color;
    bool m_leftToRight;
    int m_lengthIndex;
    int m_width;

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

    //* Specific setters
    void setColor(color i_color) { m_color = i_color; }
    void setLeftToRight(bool i_leftToRight) { m_leftToRight = i_leftToRight; }
    void setLengthIndex(int i_lengthIndex) { m_lengthIndex = i_lengthIndex; }
    void setWidth(int i_width) { m_width = i_width; }
    //* Set Common Parameters
    void setCommpnParams(CommonInputParams &i_commonInputParams)
    {
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
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
SimpleHorizontalArrow::SimpleHorizontalArrow()
{
    //* common setters
    m_prefAfter = "_SimpleHorizontalArrow";

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
    m_fullName = m_pref + m_prefAfter + TimeToString(i_time) + i_name;
    // Draw the horizontal arrow on the chart
    ObjectCreate(m_chartID, m_fullName, OBJ_ARROWED_LINE, m_subWindow, i_time, i_value, time2, i_value);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_COLOR, m_color);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_WIDTH, m_width);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_SELECTABLE, m_selectable);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_SELECTED, m_selected);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_BACK, m_inBackground);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_HIDDEN, m_hiddenInList);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_ZORDER, m_zOrder);
    ChartRedraw(m_chartID);
}