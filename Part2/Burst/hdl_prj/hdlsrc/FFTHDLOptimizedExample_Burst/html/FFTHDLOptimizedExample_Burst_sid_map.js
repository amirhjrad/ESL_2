function RTW_SidParentMap() {
    this.sidParentMap = new Array();
    this.sidParentMap["FFTHDLOptimizedExample_Burst:7"] = "FFTHDLOptimizedExample_Burst:6";
    this.sidParentMap["FFTHDLOptimizedExample_Burst:8"] = "FFTHDLOptimizedExample_Burst:6";
    this.sidParentMap["FFTHDLOptimizedExample_Burst:1"] = "FFTHDLOptimizedExample_Burst:6";
    this.sidParentMap["FFTHDLOptimizedExample_Burst:9"] = "FFTHDLOptimizedExample_Burst:6";
    this.sidParentMap["FFTHDLOptimizedExample_Burst:36"] = "FFTHDLOptimizedExample_Burst:6";
    this.sidParentMap["FFTHDLOptimizedExample_Burst:57"] = "FFTHDLOptimizedExample_Burst:6";
    this.getParentSid = function(sid) { return this.sidParentMap[sid];}
}
    RTW_SidParentMap.instance = new RTW_SidParentMap();
