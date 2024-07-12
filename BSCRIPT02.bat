@echo off

echo Welcome to the Shape Area Calculator

:menu
echo.
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
choice /c 123 /m "Choose a shape you want to calculate:"

if errorlevel 3 goto quadrilateral
if errorlevel 2 goto triangle
if errorlevel 1 goto circle

:circle
    set /p radius=Enter the radius of circle:
    set /a areaInt=314159 * %radius% * %radius% / 100000
    echo The area of the circle is approximately: %areaInt%
    goto end

:triangle
    set /p a=Enter the side length of the first side:
    set /p b=Enter the side length of the second side:
    set /p c=Enter the side length of the third side:

    set /a s=(%a% + %b% + %c%) / 2
    set /a area=(%s% * (%s% - %a%) * (%s% - %b%) * (%s% - %c%))
    
    setlocal enabledelayedexpansion
    set /a "precision=10000, result=0, num=!area!"
    for /l %%i in (1,1,10000) do (
        set /a "result=result + (num / precision) - result"
        set /a "precision=precision / 2"
    )
    endlocal & set area=!result!
    echo The area of the triangle is approximately: %area%

    if %a%==%b% if %b%==%c% (
        echo The triangle is equilateral.
    ) else if %a%==%b% if %a% neq %c% (
        echo The triangle is isosceles.
    ) else if %a% neq %b% if %a% neq %c% if %b% neq %c% (
        echo The triangle is scalene.
    )
    goto end

:quadrilateral
    set /p length=Enter the side length:
    set /p width=Enter the side width:
    set /a area=%length% * %width%
    echo The area of the quadrilateral is: %area%

    if %length%==%width% (
        echo The quadrilateral is a square.
    ) else (
        echo The quadrilateral is a rectangle.
    )
    goto end

:end
echo Thank you for using my Shape Calculator
pause