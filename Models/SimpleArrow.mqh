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
#include "CommonInputParams.mqh"
#include "../Enums/ENUM_SLTP_COLOR_MODE.mqh"
/*=========================================== class ===========================================*/
class SimpleArrow : public CommonInputParams
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    // * Specific Parameters
    color m_buyColor;
    color m_sellColor;
    int m_buyCode;
    int m_sellCode;
    int m_width;

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

    //* Specific setters
    void setBuyColor(color i_buyColor) { m_buyColor = i_buyColor; }
    void setSellColor(color i_sellColor) { m_sellColor = i_sellColor; }
    void setBuyCode(int i_buyCode) { m_buyCode = i_buyCode; }
    void setSellCode(int i_sellCode) { m_sellCode = i_sellCode; }
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
SimpleArrow::SimpleArrow()
{
    //* common setters
    m_prefAfter = "_simpleArrow";

    //* Specific setters
    m_buyColor = clrGreen;
    m_sellColor = clrRed;
    m_buyCode = 233;
    m_sellCode = 234;
    m_width = 1;
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
SimpleArrow::~SimpleArrow() {

};

/**================================================================================================
 **                                           put
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
};