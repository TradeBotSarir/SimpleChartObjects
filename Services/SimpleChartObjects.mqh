//+------------------------------------------------------------------+
//|                                           SimpleChartObjects.mqh |
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
#include "../Models/SimpleArrow.mqh"
#include "../Models/SimpleHorizontalArrow.mqh"
#include "../Models/SimpleRect.mqh"
#include "../Models/ArrowSlTp.mqh"
#include "../Models/SimpleHorizontalLine.mqh"
/*=========================================== class ===========================================*/
class SimpleChartObjects
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/

public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    SimpleArrow arrow;
    SimpleHorizontalArrow horizontalArrow;
    SimpleRect rect;
    ArrowSlTp arrowSlTp;
    SimpleHorizontalLine horizontalLine;

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    SimpleChartObjects();

    //* Destructor
    ~SimpleChartObjects();

    //* Delete object
    bool deleteObject(const string i_name, const long i_chartId = 0)
    {
        return ObjectDelete(i_chartId, i_name);
    };

    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
SimpleChartObjects::SimpleChartObjects() {

};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
SimpleChartObjects::~SimpleChartObjects() {

};
