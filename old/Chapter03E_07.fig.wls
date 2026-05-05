#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]

SetDirectory[NotebookDirectory[]];

nbFileName="Chapter03E_07.fig.wls";
nbPDFName="build/"<>StringReplace[nbFileName,"wls"->"pdf"];
nbPDFNameList=(StringReplace[nbPDFName,".fig"->#<>".fig"]&)/@Alphabet[];
Export[nbPDFName,""]

fig1=Plot[(Sin[x]/x)^2,{x,-15,15},PlotRange->{0,1},Frame->True,AspectRatio->0.5]
fig2=Plot[((2 BesselJ[1,x])/x)^2,{x,-15,15},PlotRange->{0,1},Frame->True,AspectRatio->0.5]

fig={fig1,fig2}

figWithName=Transpose[{fig,nbPDFNameList[[1;;Length[fig]]]}];
ReleaseHold[(Hold[Export[#[[2]],#[[1]],ImageResolution->2000]]&)/@figWithName]