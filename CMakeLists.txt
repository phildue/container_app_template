cmake_minimum_required(VERSION 3.0)
project(app CXX)
                    

add_executable(${PROJECT_NAME} src/app.cpp)

install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME}Targets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
    )


