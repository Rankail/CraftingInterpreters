workspace "clox"
    architecture "x86_64"
    startproject "clox"

    configurations {
        "Debug", "OptimizedDebug", "Optimized"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "clox"