Attribute VB_Name = "TestMeasOffset"
'@IgnoreModule LineLabelNotUsed
''' TopoXL: Excel UDF library for land surveyors
''' Copyright (C) 2019 Bogdan Morosanu and Cristian Buse
''' This program is free software: you can redistribute it and/or modify
''' it under the terms of the GNU General Public License as published by
''' the Free Software Foundation, either version 3 of the License, or
''' (at your option) any later version.
'''
''' This program is distributed in the hope that it will be useful,
''' but WITHOUT ANY WARRANTY; without even the implied warranty of
''' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
''' GNU General Public License for more details.
'''
''' You should have received a copy of the GNU General Public License
''' along with this program.  If not, see <https://www.gnu.org/licenses/>.

'@TestModule
'@Folder("Tests")

Option Explicit
Option Private Module

Private Assert As Object
Private Fakes As Object

'@ModuleInitialize
Public Sub ModuleInitialize()
    'this method runs once per module.
    Set Assert = CreateObject("Rubberduck.AssertClass")
    Set Fakes = CreateObject("Rubberduck.FakesProvider")
End Sub

'@ModuleCleanup
Public Sub ModuleCleanup()
    'this method runs once per module.
    Set Assert = Nothing
    Set Fakes = Nothing
End Sub

'@TestInitialize
Public Sub TestInitialize()
    'this method runs before every test in the module.
End Sub

'@TestCleanup
Public Sub TestCleanup()
    'this method runs after every test in the module.
End Sub

'@TestMethod
Public Sub TestToString()
    On Error GoTo TestFail
    
    'Arrange:
    Dim sut As New MeasOffset
    Dim expected As Variant
    
    'Act:
    sut.init 3.33, -3#
    expected = "(3.33,-3)"
    
    'Assert:
    Assert.AreEqual expected, sut.toString

TestExit:
    Exit Sub
TestFail:
    Assert.Fail "Test raised an error: #" & Err.Number & " - " & Err.Description
End Sub

'@TestMethod
Public Sub TestIsEqual()
    On Error GoTo TestFail
    
    'Arrange:
    Dim sut As New MeasOffset
    Dim eMO As New MeasOffset                    'equivalent Point
    Dim m As Double
    Dim o As Double
    
    'Act:
    m = 1 / 3
    o = Math.Sqr(2)
    
    sut.init m, o
    eMO.init m, o

    'Assert:
    Assert.IsTrue sut.isEqual(eMO), "M and O of equivalent MeasOffset are different!"

TestExit:
    Exit Sub
TestFail:
    Assert.Fail "Test raised an error: #" & Err.Number & " - " & Err.Description
End Sub

