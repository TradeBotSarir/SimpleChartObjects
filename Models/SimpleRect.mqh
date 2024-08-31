//+------------------------------------------------------------------+
//|                                                    SimpleRect.mqh |
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
#include "../Enums/ENUM_SIMPLE_RECT_COLOR_MODE.mqh"
#include "CommonInputParams.mqh"
/*=========================================== class ===========================================*/
class SimpleRect : public CommonInputParams
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    // * Specific Parameters
    int m_width;
    bool m_fill;
    color m_borderColor;
    color m_bgColor;
    color m_buyRectBgColor;
    color m_sellRectBgColor;
    color m_buyRectBorderColor;
    color m_sellRectBorderColor;
    ENUM_LINE_STYLE m_style;
    ENUM_SIMPLE_RECT_COLOR_MODE m_colorMode;
    /*------------------------------------------- Methods -------------------------------------------*/
    color calcBgColor(int i_trendType = 0, double i_price_1 = 0, double i_price_2 = 0);
    color calcBorderColor(int i_trendType = 0, double i_price_1 = 0, double i_price_2 = 0);

public:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    SimpleRect();

    //* Destructor
    ~SimpleRect();

    /*=========================================== put Rect , Method One ===========================================*/
    void put(const double i_price_1, const datetime i_time_1, const double i_price_2, const datetime i_time_2, string i_name = "");

    /*------------------------------------------- Setters -------------------------------------------*/
    //* common setters
    void setPref(string i_pref)
    {
        m_pref = i_pref;
    }

    //* Specific setters
    void setFill(bool i_fill) { m_fill = i_fill; }
    void setBorderColor(color i_borderColor) { m_borderColor = i_borderColor; }
    void setBgColor(color i_bgColor) { m_bgColor = i_bgColor; }
    void setStyle(ENUM_LINE_STYLE i_style) { m_style = i_style; }
    void setBuyRectBgColor(color i_buyRectBgColor) { m_buyRectBgColor = i_buyRectBgColor; }
    void setSellRectBgColor(color i_sellRectBgColor) { m_sellRectBgColor = i_sellRectBgColor; }
    void setBuyRectBorderColor(color i_buyRectBorderColor) { m_buyRectBorderColor = i_buyRectBorderColor; }
    void setSellRectBorderColor(color i_sellRectBorderColor) { m_sellRectBorderColor = i_sellRectBorderColor; }
    void setColorMode(ENUM_SIMPLE_RECT_COLOR_MODE i_colorMode) { m_colorMode = i_colorMode; }
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
    };

    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
SimpleRect::SimpleRect()
{
    //* common setters
    m_prefAfter = "_simpleRect";
    //* Specific setters
    m_fill = false;
    m_borderColor = clrBlack;
    m_bgColor = clrWhite;
    m_style = STYLE_SOLID;
    m_buyRectBgColor = clrGreen;
    m_sellRectBgColor = clrRed;
    m_buyRectBorderColor = clrGreen;
    m_sellRectBorderColor = clrRed;
    m_colorMode = SIMPLE_RECT_SINGLE_COLOR;
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
SimpleRect::~SimpleRect() {

};
/**================================================================================================
 **                                      calcBgColor
 *?  calc Bg color base on color mode, this color used for bg color
 ** enum ENUM_SIMPLE_RECT_COLOR_MODE
    SIMPLE_RECT_SINGLE_COLOR = 0,
    SIMPLE_RECT_COLOR_ON_PRICES = 1,
    SIMPLE_RECT_COLOR_ON_TRENDTYPE = 2
 *================================================================================================**/
color SimpleRect::calcBgColor(int i_trendType = 0, double i_price_1 = 0, double i_price_2 = 0)
{
    switch (m_colorMode)
    {
    case SIMPLE_RECT_SINGLE_COLOR:
        return m_bgColor;
    case SIMPLE_RECT_COLOR_ON_PRICES:
        return i_price_1 < i_price_2 ? m_buyRectBgColor : m_sellRectBgColor;
    case SIMPLE_RECT_COLOR_ON_TRENDTYPE:
        return i_trendType == 1 ? m_buyRectBgColor : m_sellRectBgColor;
    default:
        return m_bgColor;
    }
}

/**================================================================================================
 **                                      calcBorderColor
 *?  calc Border color base on color mode, this color used for border color
 ** enum ENUM_SIMPLE_RECT_COLOR_MODE
    SIMPLE_RECT_SINGLE_COLOR = 0,
    SIMPLE_RECT_COLOR_ON_PRICES = 1,
    SIMPLE_RECT_COLOR_ON_TRENDTYPE = 2
 *================================================================================================**/
color SimpleRect::calcBorderColor(int i_trendType = 0, double i_price_1 = 0, double i_price_2 = 0)
{
    switch (m_colorMode)
    {
    case SIMPLE_RECT_SINGLE_COLOR:
        return m_borderColor;
    case SIMPLE_RECT_COLOR_ON_PRICES:
    {
        if (i_price_1 == 0 || i_price_2 == 0)
        {
            Print("Error : price_1 or price_2 is zero, Function : ", __FUNCTION__);
        }
        return i_price_1 < i_price_2 ? m_buyRectBorderColor : m_sellRectBorderColor;
    }
    case SIMPLE_RECT_COLOR_ON_TRENDTYPE:
    {
        if (!(i_trendType == 1 || i_trendType == -1))
        {
            Print("Error : trendType must be 1 or -1, Function : ", __FUNCTION__);
        }
        return i_trendType == 1 ? m_buyRectBorderColor : m_sellRectBorderColor;
    }
    default:
        return m_borderColor;
    }
}
/**================================================================================================
 **                                      put
 *?  put Rect , Method One
 ** input : price1, time1, price2, time2
 *================================================================================================**/

void SimpleRect::put(const double i_price_1, const datetime i_time_1, const double i_price_2, const datetime i_time_2, string i_name = "")
{
    color bgColor = calcBgColor(0, i_price_1, i_price_2);
    color borderColor = calcBorderColor(0, i_price_1, i_price_2);
    // Draw the Rect on the chart
    ObjectCreate(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJ_RECTANGLE, m_subWindow, i_time_1, i_price_1, i_time_2, i_price_2);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_WIDTH, m_width);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_SELECTABLE, m_selectable);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_SELECTED, m_selected);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_BACK, m_inBackground);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_HIDDEN, m_hiddenInList);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_ZORDER, m_zOrder);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_COLOR, borderColor);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_BGCOLOR, bgColor);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_STYLE, m_style);
    ObjectSetInteger(m_chartID, m_pref + m_prefAfter + TimeToString(i_time_1) + TimeToString(i_time_2) + i_name, OBJPROP_FILL, m_fill);
    ChartRedraw(m_chartID);
}
