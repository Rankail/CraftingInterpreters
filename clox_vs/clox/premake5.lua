project "clox"
    kind "ConsoleApp"
    language "C"
    cdialect "default"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/"..outputdir.."/")
    objdir ("%{wks.location}/bin-int/"..outputdir.."/")
    
    files {
        "**.h",
        "**.c"
    }

    prebuildcommands {
        ('{COPYFILE} "%{prj.location}/test.clox" "%{wks.location}/bin/'..outputdir..'/test.clox"')
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines { "DEBUG_PRINT_CODE", "DEBUG_TRACE_EXECUTION" }
        runtime "Debug"
        symbols "On"

    filter "configurations:OptimizedDebug"
        defines { "DEBUG_PRINT_CODE" }
        runtime "Release"
        optimize "Speed"
        symbols "On"

    filter "configurations:Optimized"
        runtime "Release"
        optimize "Speed"
        symbols "Off"