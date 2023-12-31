cmake_minimum_required(VERSION 3.16)

project(weather_app VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appweather_app
    main.cpp
)

qt_add_qml_module(appweather_app
    URI weather_app
    VERSION 1.0
    QML_FILES
        Main.qml
        Secret/Api_key.js
        JS/API_Calls/Weather_from_city.js
        CustomComponents/Search_Circle.qml
        CustomComponents/Bar_view.qml
        CustomComponents/Weather_info.qml
        CustomComponents/DarkMode_button.qml
        JS/Show_results.js

        SOURCES temp_convertion.h temp_convertion.cpp timestamp_convertion.h timestamp_convertion.cpp current_weather.h current_weather.cpp
        QML_FILES js/test.json
        QML_FILES CustomComponents/Unit_button.qml


)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appweather_app PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appweather_app
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appweather_app
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appweather_app
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
