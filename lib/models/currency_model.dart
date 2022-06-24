class CurrencyModel {
  String? result;
  String? documentation;
  String? termsOfUse;
  int? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  int? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  String? baseCode;
  ConversionRates? conversionRates;

  CurrencyModel(
      {this.result,
      this.documentation,
      this.termsOfUse,
      this.timeLastUpdateUnix,
      this.timeLastUpdateUtc,
      this.timeNextUpdateUnix,
      this.timeNextUpdateUtc,
      this.baseCode,
      this.conversionRates});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    documentation = json['documentation'];
    termsOfUse = json['terms_of_use'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    timeLastUpdateUtc = json['time_last_update_utc'];
    timeNextUpdateUnix = json['time_next_update_unix'];
    timeNextUpdateUtc = json['time_next_update_utc'];
    baseCode = json['base_code'];
    conversionRates = json['conversion_rates'] != null
        ? new ConversionRates.fromJson(json['conversion_rates'])
        : null;
  }
}

class ConversionRates {
  var uSD;
  var aED;
  var aFN;
  var aLL;
  var aMD;
  var aNG;
  var aOA;
  var aRS;
  var aUD;
  var aWG;
  var aZN;
  var bAM;
  var bBD;
  var bDT;
  var bGN;
  var bHD;
  var bIF;
  var bMD;
  var bND;
  var bOB;
  var bRL;
  var bSD;
  var bTN;
  var bWP;
  var bYN;
  var bZD;
  var cAD;
  var cDF;
  var cHF;
  var cLP;
  var cNY;
  var cOP;
  var cRC;
  var cUP;
  var cVE;
  var cZK;
  var dJF;
  var dKK;
  var dOP;
  var dZD;
  var eGP;
  var eRN;
  var eTB;
  var eUR;
  var fJD;
  var fKP;
  var fOK;
  var gBP;
  var gEL;
  var gGP;
  var gHS;
  var gIP;
  var gMD;
  var gNF;
  var gTQ;
  var gYD;
  var hKD;
  var hTG;
  var hUF;
  var iDR;
  var iLS;
  var iMP;
  var iNR;
  var iQD;
  var iRR;
  var iSK;
  var jEP;
  var jMD;
  var jOD;
  var jPY;
  var kES;
  var kGS;
  var kHR;
  var kID;
  var kMF;
  var kRW;
  var kWD;
  var kYD;
  var kZT;
  var lAK;
  var lBP;
  var lKR;
  var lRD;
  var lSL;
  var lYD;
  var mAD;
  var mDL;
  var mGA;
  var mKD;
  var mMK;
  var mNT;
  var mOP;
  var mRU;
  var mUR;
  var mVR;
  var mWK;
  var mXN;
  var mYR;
  var mZN;
  var nAD;
  var nGN;
  var nIO;
  var nOK;
  var nPR;
  var nZD;
  var oMR;
  var pAB;
  var pEN;
  var pGK;
  var pHP;
  var pKR;
  var pLN;
  var pYG;
  var qAR;
  var rON;
  var rSD;
  var rUB;
  var rWF;
  var sAR;
  var sBD;
  var sCR;
  var sDG;
  var sEK;
  var sGD;
  var sHP;
  var sLL;
  var sOS;
  var sRD;
  var sSP;
  var sTN;
  var sYP;
  var sZL;
  var tHB;
  var tJS;
  var tMT;
  var tND;
  var tOP;
  var tRY;
  var tTD;
  var tVD;
  var tWD;
  var tZS;
  var uAH;
  var uGX;
  var uYU;
  var uZS;
  var vES;
  var vND;
  var vUV;
  var wST;
  var xAF;
  var xCD;
  var xDR;
  var xOF;
  var xPF;
  var yER;
  var zAR;
  var zMW;
  var zWL;
  var hNL;
  var hRK;

  ConversionRates(
      {this.uSD,
      this.aED,
      this.aFN,
      this.aLL,
      this.aMD,
      this.aNG,
      this.aOA,
      this.aRS,
      this.aUD,
      this.aWG,
      this.aZN,
      this.bAM,
      this.bBD,
      this.bDT,
      this.bGN,
      this.bHD,
      this.bIF,
      this.bMD,
      this.bND,
      this.bOB,
      this.bRL,
      this.bSD,
      this.bTN,
      this.bWP,
      this.bYN,
      this.bZD,
      this.cAD,
      this.cDF,
      this.cHF,
      this.cLP,
      this.cNY,
      this.cOP,
      this.cRC,
      this.cUP,
      this.cVE,
      this.cZK,
      this.dJF,
      this.dKK,
      this.dOP,
      this.dZD,
      this.eGP,
      this.eRN,
      this.eTB,
      this.eUR,
      this.fJD,
      this.fKP,
      this.fOK,
      this.gBP,
      this.gEL,
      this.gGP,
      this.gHS,
      this.gIP,
      this.gMD,
      this.gNF,
      this.gTQ,
      this.gYD,
      this.hKD,
      this.hNL,
      this.hRK,
      this.hTG,
      this.hUF,
      this.iDR,
      this.iLS,
      this.iMP,
      this.iNR,
      this.iQD,
      this.iRR,
      this.iSK,
      this.jEP,
      this.jMD,
      this.jOD,
      this.jPY,
      this.kES,
      this.kGS,
      this.kHR,
      this.kID,
      this.kMF,
      this.kRW,
      this.kWD,
      this.kYD,
      this.kZT,
      this.lAK,
      this.lBP,
      this.lKR,
      this.lRD,
      this.lSL,
      this.lYD,
      this.mAD,
      this.mDL,
      this.mGA,
      this.mKD,
      this.mMK,
      this.mNT,
      this.mOP,
      this.mRU,
      this.mUR,
      this.mVR,
      this.mWK,
      this.mXN,
      this.mYR,
      this.mZN,
      this.nAD,
      this.nGN,
      this.nIO,
      this.nOK,
      this.nPR,
      this.nZD,
      this.oMR,
      this.pAB,
      this.pEN,
      this.pGK,
      this.pHP,
      this.pKR,
      this.pLN,
      this.pYG,
      this.qAR,
      this.rON,
      this.rSD,
      this.rUB,
      this.rWF,
      this.sAR,
      this.sBD,
      this.sCR,
      this.sDG,
      this.sEK,
      this.sGD,
      this.sHP,
      this.sLL,
      this.sOS,
      this.sRD,
      this.sSP,
      this.sTN,
      this.sYP,
      this.sZL,
      this.tHB,
      this.tJS,
      this.tMT,
      this.tND,
      this.tOP,
      this.tRY,
      this.tTD,
      this.tVD,
      this.tWD,
      this.tZS,
      this.uAH,
      this.uGX,
      this.uYU,
      this.uZS,
      this.vES,
      this.vND,
      this.vUV,
      this.wST,
      this.xAF,
      this.xCD,
      this.xDR,
      this.xOF,
      this.xPF,
      this.yER,
      this.zAR,
      this.zMW,
      this.zWL});

  ConversionRates.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'];
    aED = json['AED'];
    aFN = json['AFN'];
    aLL = json['ALL'];
    aMD = json['AMD'];
    aNG = json['ANG'];
    aOA = json['AOA'];
    aRS = json['ARS'];
    aUD = json['AUD'];
    aWG = json['AWG'];
    aZN = json['AZN'];
    bAM = json['BAM'];
    bBD = json['BBD'];
    bDT = json['BDT'];
    bGN = json['BGN'];
    bHD = json['BHD'];
    bIF = json['BIF'];
    bMD = json['BMD'];
    bND = json['BND'];
    bOB = json['BOB'];
    bRL = json['BRL'];
    bSD = json['BSD'];
    bTN = json['BTN'];
    bWP = json['BWP'];
    bYN = json['BYN'];
    bZD = json['BZD'];
    cAD = json['CAD'];
    cDF = json['CDF'];
    cHF = json['CHF'];
    cLP = json['CLP'];
    cNY = json['CNY'];
    cOP = json['COP'];
    cRC = json['CRC'];
    cUP = json['CUP'];
    cVE = json['CVE'];
    cZK = json['CZK'];
    dJF = json['DJF'];
    dKK = json['DKK'];
    dOP = json['DOP'];
    dZD = json['DZD'];
    eGP = json['EGP'];
    eRN = json['ERN'];
    eTB = json['ETB'];
    eUR = json['EUR'];
    fJD = json['FJD'];
    fKP = json['FKP'];
    fOK = json['FOK'];
    gBP = json['GBP'];
    gEL = json['GEL'];
    gGP = json['GGP'];
    gHS = json['GHS'];
    gIP = json['GIP'];
    gMD = json['GMD'];
    gNF = json['GNF'];
    gTQ = json['GTQ'];
    gYD = json['GYD'];
    hKD = json['HKD'];
    hNL = json['HNL'];
    hRK = json['HRK'];
    hTG = json['HTG'];
    hUF = json['HUF'];
    iDR = json['IDR'];
    iLS = json['ILS'];
    iMP = json['IMP'];
    iNR = json['INR'];
    iQD = json['IQD'];
    iRR = json['IRR'];
    iSK = json['ISK'];
    jEP = json['JEP'];
    jMD = json['JMD'];
    jOD = json['JOD'];
    jPY = json['JPY'];
    kES = json['KES'];
    kGS = json['KGS'];
    kHR = json['KHR'];
    kID = json['KID'];
    kMF = json['KMF'];
    kRW = json['KRW'];
    kWD = json['KWD'];
    kYD = json['KYD'];
    kZT = json['KZT'];
    lAK = json['LAK'];
    lBP = json['LBP'];
    lKR = json['LKR'];
    lRD = json['LRD'];
    lSL = json['LSL'];
    lYD = json['LYD'];
    mAD = json['MAD'];
    mDL = json['MDL'];
    mGA = json['MGA'];
    mKD = json['MKD'];
    mMK = json['MMK'];
    mNT = json['MNT'];
    mOP = json['MOP'];
    mRU = json['MRU'];
    mUR = json['MUR'];
    mVR = json['MVR'];
    mWK = json['MWK'];
    mXN = json['MXN'];
    mYR = json['MYR'];
    mZN = json['MZN'];
    nAD = json['NAD'];
    nGN = json['NGN'];
    nIO = json['NIO'];
    nOK = json['NOK'];
    nPR = json['NPR'];
    nZD = json['NZD'];
    oMR = json['OMR'];
    pAB = json['PAB'];
    pEN = json['PEN'];
    pGK = json['PGK'];
    pHP = json['PHP'];
    pKR = json['PKR'];
    pLN = json['PLN'];
    pYG = json['PYG'];
    qAR = json['QAR'];
    rON = json['RON'];
    rSD = json['RSD'];
    rUB = json['RUB'];
    rWF = json['RWF'];
    sAR = json['SAR'];
    sBD = json['SBD'];
    sCR = json['SCR'];
    sDG = json['SDG'];
    sEK = json['SEK'];
    sGD = json['SGD'];
    sHP = json['SHP'];
    sLL = json['SLL'];
    sOS = json['SOS'];
    sRD = json['SRD'];
    sSP = json['SSP'];
    sTN = json['STN'];
    sYP = json['SYP'];
    sZL = json['SZL'];
    tHB = json['THB'];
    tJS = json['TJS'];
    tMT = json['TMT'];
    tND = json['TND'];
    tOP = json['TOP'];
    tRY = json['TRY'];
    tTD = json['TTD'];
    tVD = json['TVD'];
    tWD = json['TWD'];
    tZS = json['TZS'];
    uAH = json['UAH'];
    uGX = json['UGX'];
    uYU = json['UYU'];
    uZS = json['UZS'];
    vES = json['VES'];
    vND = json['VND'];
    vUV = json['VUV'];
    wST = json['WST'];
    xAF = json['XAF'];
    xCD = json['XCD'];
    xDR = json['XDR'];
    xOF = json['XOF'];
    xPF = json['XPF'];
    yER = json['YER'];
    zAR = json['ZAR'];
    zMW = json['ZMW'];
    zWL = json['ZWL'];
  }
}
