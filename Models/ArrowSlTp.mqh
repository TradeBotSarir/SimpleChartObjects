//+------------------------------------------------------------------+
//|                                                    ArrowSlTp.mqh |
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
#include "SimpleHorizontalArrow.mqh"
#include "../Enums/ENUM_SLTP_COLOR_MODE.mqh"
/*=========================================== class ===========================================*/
class ArrowSlTp
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/
    SimpleHorizontalArrow m_slArrow;
    SimpleHorizontalArrow m_tpArrow;
    /*------------------------------------------- Methods -------------------------------------------*/
    color calcSlColor(int i_index);
    color calcTpColor(int i_index);

public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    //* Common Parameters

    // * Specific Parameters
    ENUM_SLTP_COLOR_MODE m_sltpColorMode;
    color m_solidSlColor;
    color m_solidTpColor;
    color slColors[];
    color tpColors[];
    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    ArrowSlTp();

    //* Destructor
    ~ArrowSlTp();

    /*=========================================== put SLTP , Method One ===========================================*/
    void put(const datetime i_time, double &iSls[], double &iTps[], string i_name = "");
    /*------------------------------------------- Getters -------------------------------------------*/

    /*------------------------------------------- Setters -------------------------------------------*/
    //* common setters
    void setPref(string i_pref)
    {
        m_slArrow.setPref(i_pref);
        m_tpArrow.setPref(i_pref);
    };
    void setPrefAfter(string i_prefAfter)
    {
        m_slArrow.setPrefAfter(i_prefAfter);
        m_tpArrow.setPrefAfter(i_prefAfter);
    };
    void setWidth(int i_width)
    {
        m_slArrow.setWidth(i_width);
        m_tpArrow.setWidth(i_width);
    };
    void setSelectable(bool i_selectable)
    {
        m_slArrow.setSelectable(i_selectable);
        m_tpArrow.setSelectable(i_selectable);
    };
    void setSelected(bool i_selected)
    {
        m_slArrow.setSelected(i_selected);
        m_tpArrow.setSelected(i_selected);
    };
    void setInBackground(bool i_inBackground)
    {
        m_slArrow.setInBackground(i_inBackground);
        m_tpArrow.setInBackground(i_inBackground);
    };
    void setHiddenInList(bool i_hiddenInList)
    {
        m_slArrow.setHiddenInList(i_hiddenInList);
        m_tpArrow.setHiddenInList(i_hiddenInList);
    };
    void setChartID(long i_chartID)
    {
        m_slArrow.setChartID(i_chartID);
        m_tpArrow.setChartID(i_chartID);
    };
    void setSubWindow(int i_subWindow)
    {
        m_slArrow.setSubWindow(i_subWindow);
        m_tpArrow.setSubWindow(i_subWindow);
    };
    void setZOrder(long i_zOrder)
    {
        m_slArrow.setZOrder(i_zOrder);
        m_tpArrow.setZOrder(i_zOrder);
    };
    //* Specific setters
    void setSolidSlColor(color i_solidSlColor)
    {
        m_solidSlColor = i_solidSlColor;
    };
    void setSolidTpColor(color i_solidTpColor)
    {
        m_solidTpColor = i_solidTpColor;
    };
    void setSlColors(color &i_slColors[])
    {
        ArrayCopy(slColors, i_slColors);
    };
    void setTpColors(color &i_tpColors[])
    {
        ArrayCopy(tpColors, i_tpColors);
    };
    void setSltpColorMode(ENUM_SLTP_COLOR_MODE i_sltpColorMode)
    {
        m_sltpColorMode = i_sltpColorMode;
    };
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
ArrowSlTp::ArrowSlTp()
{
    m_solidSlColor = clrRed;
    m_solidTpColor = clrGreen;
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
ArrowSlTp::~ArrowSlTp() {

};

/**================================================================================================
 * *                                      put SLTP , Method One
 *================================================================================================**/
void ArrowSlTp::put(const datetime i_time, double &iSls[], double &iTps[], string i_name = "")
{
    for (int i = 0; i < ArraySize(iSls); i++)
    {
        if (iSls[i] != 0)
        {
            color slColor = calcSlColor(i);
            m_slArrow.setColor(slColor);
            m_slArrow.put(i_time, iSls[i], i_name);
        }
    }
    for (int i = 0; i < ArraySize(iTps); i++)
    {
        if (iTps[i] != 0)
        {
            color tpColor = calcTpColor(i);
            m_tpArrow.setColor(tpColor);
            m_tpArrow.put(i_time, iTps[i], i_name);
        }
    }
};

/**================================================================================================
 **                                      calcSlColor
 *?  calc sl color base on color mode
enum ENUM_SLTP_COLOR_MODE
    SIMPLE_SLTP_SOLID_COLOR = 0,
    SIMPLE_SLTP_ARRAY_COLOR = 1
 *================================================================================================**/
color ArrowSlTp::calcSlColor(int i_index)
{
    switch (m_sltpColorMode)
    {
    case SIMPLE_SLTP_SOLID_COLOR:
        return m_solidSlColor;
    case SIMPLE_SLTP_ARRAY_COLOR:
    {
        if (ArraySize(slColors) <= i_index && slColors[i_index] != NULL)
        {
            return slColors[i_index];
        }
        return m_solidSlColor;
    }
    default:
        return m_solidSlColor;
    }
}

/**================================================================================================
 **                                      calcTpColor
 *?  calc tp color base on color mode
enum ENUM_SLTP_COLOR_MODE
    SIMPLE_SLTP_SOLID_COLOR = 0,
    SIMPLE_SLTP_ARRAY_COLOR = 1
*================================================================================================**/
color ArrowSlTp::calcTpColor(int i_index)
{
    switch (m_sltpColorMode)
    {
    case SIMPLE_SLTP_SOLID_COLOR:
        return m_solidTpColor;
    case SIMPLE_SLTP_ARRAY_COLOR:
    {
        if (ArraySize(tpColors) <= i_index && tpColors[i_index] != NULL)
        {
            return tpColors[i_index];
        }
        return m_solidTpColor;
    }
    default:
        return m_solidTpColor;
    }
}
