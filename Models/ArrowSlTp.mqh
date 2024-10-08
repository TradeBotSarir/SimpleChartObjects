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
#include "../Enums/ENUM_SLTP_COLOR_MODE.mqh"
#include "SimpleHorizontalArrow.mqh"

/*=========================================== class ===========================================*/
class ArrowSlTp {
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/
    SimpleHorizontalArrow m_slArrow;
    SimpleHorizontalArrow m_tpArrow;
    //* Common Parameters

    // * Specific Parameters
    ENUM_SLTP_COLOR_MODE m_sltpColorMode;
    color m_solidSlColor;
    color m_solidTpColor;
    color m_slColors[];
    color m_tpColors[];
    bool m_showTps[];
    bool m_showSls[];
    long m_chartID;
    /*------------------------------------------- Methods -------------------------------------------*/
    color calcSlColor(int i_index);
    color calcTpColor(int i_index);

   public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    string slNames[];
    string tpNames[];
    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    ArrowSlTp();

    //* Destructor
    ~ArrowSlTp();

    //* Set Common Parameters
    void setCommpnParams(CommonInputParams &i_commonInputParams) {
        m_slArrow.setCommpnParams(i_commonInputParams);
        m_tpArrow.setCommpnParams(i_commonInputParams);
    };

    /*=========================================== put SLTP , Method One ===========================================*/
    void put(const datetime i_time, double &iSls[], double &iTps[], const long i_chartId = NULL, string i_name = "");
    /*=========================================== put SLTP , Method Two ===========================================*/
    void put(const int i_itr, const int i_ratesTotal, double &iSls[], double &iTps[], const long i_chartId = NULL, string i_name = "");
    /*------------------------------------------- Getters -------------------------------------------*/
    string getSlNames(int i_index);
    string getTpNames(int i_index);

    /*------------------------------------------- Setters -------------------------------------------*/
    //* common setters
    void setPref(string i_pref) {
        m_slArrow.setPref(i_pref);
        m_tpArrow.setPref(i_pref);
    };
    void setPrefAfter(string i_prefAfter) {
        m_slArrow.setPrefAfter(i_prefAfter);
        m_tpArrow.setPrefAfter(i_prefAfter);
    };
    void setWidth(int i_width) {
        m_slArrow.setWidth(i_width);
        m_tpArrow.setWidth(i_width);
    };
    void setSelectable(bool i_selectable) {
        m_slArrow.setSelectable(i_selectable);
        m_tpArrow.setSelectable(i_selectable);
    };
    void setSelected(bool i_selected) {
        m_slArrow.setSelected(i_selected);
        m_tpArrow.setSelected(i_selected);
    };
    void setInBackground(bool i_inBackground) {
        m_slArrow.setInBackground(i_inBackground);
        m_tpArrow.setInBackground(i_inBackground);
    };
    void setHiddenInList(bool i_hiddenInList) {
        m_slArrow.setHiddenInList(i_hiddenInList);
        m_tpArrow.setHiddenInList(i_hiddenInList);
    };
    void setChartID(long i_chartID) {
        m_slArrow.setChartID(i_chartID);
        m_tpArrow.setChartID(i_chartID);
    };
    void setSubWindow(int i_subWindow) {
        m_slArrow.setSubWindow(i_subWindow);
        m_tpArrow.setSubWindow(i_subWindow);
    };
    void setZOrder(long i_zOrder) {
        m_slArrow.setZOrder(i_zOrder);
        m_tpArrow.setZOrder(i_zOrder);
    };
    //* Specific setters
    void setSolidSlColor(color i_solidSlColor) {
        m_solidSlColor = i_solidSlColor;
    };
    void setSolidTpColor(color i_solidTpColor) {
        m_solidTpColor = i_solidTpColor;
    };
    void setSlColors(color &i_slColors[]) {
        ArrayCopy(m_slColors, i_slColors);
    };
    void setTpColors(color &i_tpColors[]) {
        ArrayCopy(m_tpColors, i_tpColors);
    };
    void setSltpColorMode(ENUM_SLTP_COLOR_MODE i_sltpColorMode) {
        m_sltpColorMode = i_sltpColorMode;
    };
    void setShowTps(bool &i_showTps[]) {
        ArrayCopy(m_showTps, i_showTps);
    };
    void setShowSls(bool &i_showSls[]) {
        ArrayCopy(m_showSls, i_showSls);
    };
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
ArrowSlTp::ArrowSlTp() {
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
void ArrowSlTp::put(const datetime i_time, double &iSls[], double &iTps[], const long i_chartId = NULL, string i_name = "") {
    m_chartID = i_chartId == NULL ? ChartID() : i_chartId;

    ArrayResize(slNames, ArraySize(iSls));
    ArrayResize(tpNames, ArraySize(iTps));
    for (int i = 0; i < ArraySize(iSls); i++) {
        if (iSls[i] != 0 && m_showSls[i]) {
            color slColor = calcSlColor(i);
            m_slArrow.setColor(slColor);
            slNames[i] = i_name + "sl" + string(i);
            m_slArrow.put(i_time, iSls[i], m_chartID, slNames[i]);
        }
    }
    for (int i = 0; i < ArraySize(iTps); i++) {
        if (iTps[i] != 0 && m_showTps[i]) {
            color tpColor = calcTpColor(i);
            m_tpArrow.setColor(tpColor);
            tpNames[i] = i_name + "tp" + string(i);
            m_tpArrow.put(i_time, iTps[i], m_chartID, tpNames[i]);
        }
    }
};

/**================================================================================================
 * *                                      put SLTP , Method Two
 *================================================================================================**/
void ArrowSlTp::put(const int i_itr, const int i_ratesTotal, double &iSls[], double &iTps[], const long i_chartId = NULL, string i_name = "") {
    m_chartID = i_chartId == NULL ? ChartID() : i_chartId;

    ArrayResize(slNames, ArraySize(iSls));
    ArrayResize(tpNames, ArraySize(iTps));
    for (int i = 0; i < ArraySize(iSls); i++) {
        if (iSls[i] != 0 && m_showSls[i]) {
            color slColor = calcSlColor(i);
            m_slArrow.setColor(slColor);
            slNames[i] = "sl" + i_name + string(i);
            m_slArrow.put(iTime(m_slArrow.m_symbol, m_slArrow.m_timeFrame, i_ratesTotal - i_itr - 1), iSls[i], m_chartID, slNames[i]);
        }
    }
    for (int i = 0; i < ArraySize(iTps); i++) {
        if (iTps[i] != 0 && m_showTps[i]) {
            color tpColor = calcTpColor(i);
            m_tpArrow.setColor(tpColor);
            tpNames[i] = "tp" + i_name + string(i);
            m_slArrow.put(iTime(m_slArrow.m_symbol, m_slArrow.m_timeFrame, i_ratesTotal - i_itr - 1), iTps[i], m_chartID, tpNames[i]);
        }
    }
}

/**================================================================================================
 **                                      calcSlColor
 *?  calc sl color base on color mode
enum ENUM_SLTP_COLOR_MODE
    SIMPLE_SLTP_SOLID_COLOR = 0,
    SIMPLE_SLTP_ARRAY_COLOR = 1
 *================================================================================================**/
color ArrowSlTp::calcSlColor(int i_index) {
    switch (m_sltpColorMode) {
        case SIMPLE_SLTP_SOLID_COLOR:
            return m_solidSlColor;
        case SIMPLE_SLTP_ARRAY_COLOR: {
            if (ArraySize(m_slColors) <= i_index && m_slColors[i_index] != NULL) {
                return m_slColors[i_index];
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
color ArrowSlTp::calcTpColor(int i_index) {
    switch (m_sltpColorMode) {
        case SIMPLE_SLTP_SOLID_COLOR:
            return m_solidTpColor;
        case SIMPLE_SLTP_ARRAY_COLOR: {
            if (ArraySize(m_tpColors) <= i_index && m_tpColors[i_index] != NULL) {
                return m_tpColors[i_index];
            }
            return m_solidTpColor;
        }
        default:
            return m_solidTpColor;
    }
};

/**================================================================================================
 * *                                      Getters
 *================================================================================================**/
string ArrowSlTp::getSlNames(int i_index) {
    if (ArraySize(slNames) <= i_index && slNames[i_index] != NULL) {
        return slNames[i_index];
    }
    return "";
};

string ArrowSlTp::getTpNames(int i_index) {
    if (ArraySize(tpNames) <= i_index && tpNames[i_index] != NULL) {
        return tpNames[i_index];
    }
    return "";
};
