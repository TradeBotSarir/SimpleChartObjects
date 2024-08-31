//+------------------------------------------------------------------+
//|                                                    SimpleHorizontalLine.mqh |
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
class SimpleHorizontalLine : public CommonInputParams
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    // * Specific Parameters
    color m_color;
    bool m_leftToRight;
    int m_lengthIndex;
    int m_width;
    bool m_rayRight;
    bool m_rayLeft;
    ENUM_LINE_STYLE m_lineStyle;

    /*------------------------------------------- Methods -------------------------------------------*/

public:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    SimpleHorizontalLine();

    //* Destructor
    ~SimpleHorizontalLine();

    /*=========================================== put horizontal Arrow , Method One ===========================================*/
    void put(const datetime i_time, double i_value, string i_name = "");

    /*------------------------------------------- Setters -------------------------------------------*/

    //* Specific setters
    void setColor(color i_color) { m_color = i_color; }
    void setLeftToRight(bool i_leftToRight) { m_leftToRight = i_leftToRight; }
    void setLengthIndex(int i_lengthIndex) { m_lengthIndex = i_lengthIndex; }
    void setWidth(int i_width) { m_width = i_width; }
    void setRayRight(bool i_rayRight) { m_rayRight = i_rayRight; }
    void setRayLeft(bool i_rayLeft) { m_rayLeft = i_rayLeft; }
    void setLineStyle(ENUM_LINE_STYLE i_lineStyle) { m_lineStyle = i_lineStyle; }

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
SimpleHorizontalLine::SimpleHorizontalLine()
{
    //* common setters
    m_prefAfter = "_SimpleHorizontalLine";

    //* Specific setters
    m_color = clrBlack;
    m_leftToRight = true;
    m_lengthIndex = 5;
    m_rayRight = false;
    m_rayLeft = false;
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
SimpleHorizontalLine::~SimpleHorizontalLine() {

};

/**================================================================================================
 **                                      put
 *?  put horizontal LINE , Method One
 ** input : datetime
 * uses just time to draw LINE
 *================================================================================================**/

void SimpleHorizontalLine::put(const datetime i_time, double i_value, string i_name = "")
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
    ObjectCreate(m_chartID, m_fullName, OBJ_TREND, m_subWindow, i_time, i_value, time2, i_value);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_COLOR, m_color);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_WIDTH, m_width);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_SELECTABLE, m_selectable);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_SELECTED, m_selected);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_BACK, m_inBackground);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_HIDDEN, m_hiddenInList);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_ZORDER, m_zOrder);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_RAY_RIGHT, m_rayRight);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_RAY_LEFT, m_rayLeft);
    ObjectSetInteger(m_chartID, m_fullName, OBJPROP_STYLE, m_lineStyle);
    ChartRedraw(m_chartID);
}