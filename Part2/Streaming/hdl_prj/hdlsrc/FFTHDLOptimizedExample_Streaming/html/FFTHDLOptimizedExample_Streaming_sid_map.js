function RTW_SidParentMap() {
    this.sidParentMap = new Array();
    this.sidParentMap["FFTHDLOptimizedExample_Streaming:7"] = "FFTHDLOptimizedExample_Streaming:6";
    this.sidParentMap["FFTHDLOptimizedExample_Streaming:8"] = "FFTHDLOptimizedExample_Streaming:6";
    this.sidParentMap["FFTHDLOptimizedExample_Streaming:1"] = "FFTHDLOptimizedExample_Streaming:6";
    this.sidParentMap["FFTHDLOptimizedExample_Streaming:9"] = "FFTHDLOptimizedExample_Streaming:6";
    this.sidParentMap["FFTHDLOptimizedExample_Streaming:36"] = "FFTHDLOptimizedExample_Streaming:6";
    this.getParentSid = function(sid) { return this.sidParentMap[sid];}
}
    RTW_SidParentMap.instance = new RTW_SidParentMap();
