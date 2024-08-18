function RTW_Sid2UrlHash() {
	this.urlHashMap = new Array();
	/* <S1>/FFT */
	this.urlHashMap["FFTHDLOptimizedExample_Streaming:1"] = "FFT_Streaming.v:125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161";
	this.getUrlHash = function(sid) { return this.urlHashMap[sid];}
}
RTW_Sid2UrlHash.instance = new RTW_Sid2UrlHash();
function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "FFTHDLOptimizedExample_Streaming"};
	this.sidHashMap["FFTHDLOptimizedExample_Streaming"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>/DataIn"] = {sid: "FFTHDLOptimizedExample_Streaming:7"};
	this.sidHashMap["FFTHDLOptimizedExample_Streaming:7"] = {rtwname: "<S1>/DataIn"};
	this.rtwnameHashMap["<S1>/ValidIn"] = {sid: "FFTHDLOptimizedExample_Streaming:8"};
	this.sidHashMap["FFTHDLOptimizedExample_Streaming:8"] = {rtwname: "<S1>/ValidIn"};
	this.rtwnameHashMap["<S1>/FFT"] = {sid: "FFTHDLOptimizedExample_Streaming:1"};
	this.sidHashMap["FFTHDLOptimizedExample_Streaming:1"] = {rtwname: "<S1>/FFT"};
	this.rtwnameHashMap["<S1>/DataOut"] = {sid: "FFTHDLOptimizedExample_Streaming:9"};
	this.sidHashMap["FFTHDLOptimizedExample_Streaming:9"] = {rtwname: "<S1>/DataOut"};
	this.rtwnameHashMap["<S1>/ValidOut"] = {sid: "FFTHDLOptimizedExample_Streaming:36"};
	this.sidHashMap["FFTHDLOptimizedExample_Streaming:36"] = {rtwname: "<S1>/ValidOut"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
