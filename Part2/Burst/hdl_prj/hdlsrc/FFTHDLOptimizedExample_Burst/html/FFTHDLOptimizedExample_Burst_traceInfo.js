function RTW_Sid2UrlHash() {
	this.urlHashMap = new Array();
	/* <S1>/FFT */
	this.urlHashMap["FFTHDLOptimizedExample_Burst:1"] = "FFT_Burst.v:58,59,60,61,62,63,64,65,66,67";
	this.getUrlHash = function(sid) { return this.urlHashMap[sid];}
}
RTW_Sid2UrlHash.instance = new RTW_Sid2UrlHash();
function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "FFTHDLOptimizedExample_Burst"};
	this.sidHashMap["FFTHDLOptimizedExample_Burst"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>/DataIn"] = {sid: "FFTHDLOptimizedExample_Burst:7"};
	this.sidHashMap["FFTHDLOptimizedExample_Burst:7"] = {rtwname: "<S1>/DataIn"};
	this.rtwnameHashMap["<S1>/ValidIn"] = {sid: "FFTHDLOptimizedExample_Burst:8"};
	this.sidHashMap["FFTHDLOptimizedExample_Burst:8"] = {rtwname: "<S1>/ValidIn"};
	this.rtwnameHashMap["<S1>/FFT"] = {sid: "FFTHDLOptimizedExample_Burst:1"};
	this.sidHashMap["FFTHDLOptimizedExample_Burst:1"] = {rtwname: "<S1>/FFT"};
	this.rtwnameHashMap["<S1>/DataOut"] = {sid: "FFTHDLOptimizedExample_Burst:9"};
	this.sidHashMap["FFTHDLOptimizedExample_Burst:9"] = {rtwname: "<S1>/DataOut"};
	this.rtwnameHashMap["<S1>/ValidOut"] = {sid: "FFTHDLOptimizedExample_Burst:36"};
	this.sidHashMap["FFTHDLOptimizedExample_Burst:36"] = {rtwname: "<S1>/ValidOut"};
	this.rtwnameHashMap["<S1>/Ready"] = {sid: "FFTHDLOptimizedExample_Burst:57"};
	this.sidHashMap["FFTHDLOptimizedExample_Burst:57"] = {rtwname: "<S1>/Ready"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
