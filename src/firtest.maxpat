{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 4,
			"architecture" : "x86"
		}
,
		"rect" : [ 25.0, 69.0, 1405.0, 899.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-59",
					"maxclass" : "o.compose",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 757.0, 464.0, 150.0, 24.0 ],
					"presentation_rect" : [ 753.0, 463.0, 0.0, 0.0 ],
					"saved_bundle_data" : [ 35, 98, 117, 110, 100, 108, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 47, 115, 116, 114, 101, 97, 109, 47, 120, 0, 0, 0, 44, 0, 0, 0 ],
					"saved_bundle_length" : 36,
					"text" : "/stream/x",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 992.0, 712.0, 21.0, 143.0 ],
					"presentation_rect" : [ 993.0, 717.0, 0.0, 0.0 ],
					"setminmax" : [ -2.0, 2.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 672.0, 504.0, 53.0, 20.0 ],
					"text" : "o.firfilter"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 992.0, 560.0, 21.0, 143.0 ],
					"presentation_rect" : [ 994.0, 557.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 672.0, 712.0, 320.0, 143.0 ],
					"presentation_rect" : [ 674.0, 709.0, 0.0, 0.0 ],
					"setminmax" : [ -2.0, 2.0 ],
					"setstyle" : 4
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 672.0, 536.0, 73.0, 20.0 ],
					"presentation_rect" : [ 674.0, 533.0, 0.0, 0.0 ],
					"text" : "o.route /y /x"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 672.0, 560.0, 320.0, 143.0 ],
					"presentation_rect" : [ 674.0, 557.0, 0.0, 0.0 ],
					"setstyle" : 4
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-52",
					"maxclass" : "o.compose",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 416.0, 296.0, 150.0, 24.0 ],
					"saved_bundle_data" : [  ],
					"saved_bundle_length" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 296.0, 424.0, 32.5, 20.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-49",
					"linecount" : 2,
					"maxclass" : "o.expr.codebox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 296.0, 368.0, 668.0, 46.0 ],
					"presentation_rect" : [ 294.0, 327.0, 0.0, 0.0 ],
					"text" : "/stream/x ??= [],\n/stream/x = length(/stream/x) == length(/filt) ? [/x, butlast(/stream/x)] : [/x, /stream/x]",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 296.0, 336.0, 50.0, 20.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 376.0, 536.0, 21.0, 143.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 296.0, 77.0, 32.5, 20.0 ],
					"text" : "b 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 296.0, 232.0, 32.5, 20.0 ],
					"text" : "+ 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 110.5, 116.0, 20.0 ],
					"text" : "scale 0. 9999. -1. 1."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 432.0, 77.0, 88.0, 20.0 ],
					"text" : "random 10000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 56.0, 688.0, 320.0, 143.0 ],
					"presentation_rect" : [ 32.0, 766.0, 0.0, 0.0 ],
					"setstyle" : 4
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 56.0, 512.0, 73.0, 20.0 ],
					"text" : "o.route /y /x"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 56.0, 536.0, 320.0, 143.0 ],
					"setstyle" : 4
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-23",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 335.0, 17.5, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 296.0, 296.0, 50.0, 20.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 296.0, 176.0, 69.0, 20.0 ],
					"text" : "* 6.283185"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 296.0, 208.0, 46.0, 20.0 ],
					"text" : "sin 1.5"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 296.0, 144.0, 41.0, 20.0 ],
					"text" : "/ 200."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 296.0, 110.5, 84.0, 20.0 ],
					"text" : "counter 0 200"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 296.0, 17.5, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 296.0, 48.0, 58.0, 20.0 ],
					"text" : "metro 50"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "o.expr.codebox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 296.0, 492.0, 272.0, 32.0 ],
					"text" : "/y = sum(reverse(/stream/x) * /filt)",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-10",
					"linecount" : 14,
					"maxclass" : "o.compose",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 592.0, 27.0, 909.0, 201.0 ],
					"saved_bundle_data" : [ 35, 98, 117, 110, 100, 108, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, -116, 47, 102, 105, 108, 116, 0, 0, 0, 44, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 0, 0, -65, -127, 14, -85, 62, -121, -91, 37, -65, -127, 3, 6, 68, -67, -97, 50, -65, -128, -20, -14, 92, 40, 116, -23, -65, -128, -52, 102, 31, -103, -93, 85, -65, -128, -95, 89, -127, 123, -107, -93, -65, -128, 107, -48, -120, -103, 22, 60, -65, -128, 43, -47, -22, -18, -53, -48, -65, 127, -62, -34, 54, -127, -100, 77, -65, 127, 25, -128, -124, -97, -73, 107, -65, 126, 91, -59, -50, -128, -41, 0, -65, 125, -119, -2, -101, -4, -53, 66, -65, 124, -92, -128, -45, 79, 28, -12, -65, 123, -85, -67, 50, -91, -17, -109, -65, 122, -96, 36, 120, 47, 102, -96, -65, 121, -126, 60, -37, -88, -121, -55, -65, 120, 82, -100, -81, -7, -126, 98, -65, 119, 17, -30, 85, -96, 26, -110, -65, 117, -64, -68, 72, 69, 62, 35, -65, 116, 95, -29, -64, 89, 75, -9, -65, 114, -16, 26, 3, -30, 55, -61, -65, 113, 114, 53, -46, 116, -41, 109, -65, 111, -50, 38, -108, 19, 114, -50, -65, 108, -97, 39, -51, -6, 73, 93, -65, 105, 89, 87, -32, 16, -52, 86, -65, 101, -2, -86, 20, -111, 6, -93, -65, 98, -111, 33, -48, -32, 44, -47, -65, 94, 37, -102, 110, 85, -55, 10, -65, 87, 11, -75, 63, -24, 77, 92, -65, 79, -79, -59, -92, 40, 87, -89, -65, 65, 35, 55, -127, 101, 95, 25, -65, 19, -90, -61, 38, 68, -120, 38, 63, 56, -96, 78, -82, 82, -88, 7, 63, 75, 34, 118, -77, -95, -66, -67, 63, 84, -4, 91, -80, -86, -40, 48, 63, 92, 100, -70, -108, -69, -28, 71, 63, 97, -30, -53, -68, -84, 110, 51, 63, 101, -115, 31, -29, -96, 34, -10, 63, 105, 46, -5, 21, 52, -102, -111, 63, 108, -58, 9, 100, 44, -48, 67, 63, 112, 39, -10, 19, 66, 39, 23, 63, 113, -27, 50, 116, 70, 120, -32, 63, 115, -103, -113, -34, -124, -37, 28, 63, 117, 67, -9, 37, -69, -47, 82, 63, 118, -29, 78, 110, 120, 2, -58, 63, 120, 118, -125, -22, -37, -85, -115, 63, 121, -4, -112, -119, -48, 120, -44, 63, 123, 116, 111, -23, 113, -12, 14, 63, 124, -35, 45, -61, 6, -48, 84, 63, 126, 53, -43, -49, -43, -64, -68, 63, 127, 125, -119, 66, -76, 90, -112, 63, -128, 89, -75, -2, -43, 7, -81, 63, -128, -21, 86, 79, -62, -32, -26, 63, -127, 115, 71, -96, 82, -101, 88, 63, -127, -15, 45, 84, 76, 7, -107, 63, -126, 100, -78, -35, 12, -118, -2, 63, -126, -51, -115, 17, 32, 13, -25, 63, -125, 43, 116, -51, -35, 67, 18, 63, -125, 126, 41, -90, -105, -125, -21, 63, -125, -59, 119, 67, 2, -119, 28, 63, -124, 1, 43, -6, 3, -25, -106, 63, -124, 49, 31, -121, -81, -73, 61, 63, -124, 85, 51, 13, 72, -110, -20, 63, -124, 109, 78, 98, 13, -68, 43, 63, -124, 121, 94, -69, -94, 45, 17, 63, -124, 121, 94, -69, -94, 45, 17, 63, -124, 109, 78, 98, 13, -68, 43, 63, -124, 85, 51, 13, 72, -110, -20, 63, -124, 49, 31, -121, -81, -73, 61, 63, -124, 1, 43, -6, 3, -25, -106, 63, -125, -59, 119, 67, 2, -119, 28, 63, -125, 126, 41, -90, -105, -125, -21, 63, -125, 43, 116, -51, -35, 67, 18, 63, -126, -51, -115, 17, 32, 13, -25, 63, -126, 100, -78, -35, 12, -118, -2, 63, -127, -15, 45, 84, 76, 7, -107, 63, -127, 115, 71, -96, 82, -101, 88, 63, -128, -21, 86, 79, -62, -32, -26, 63, -128, 89, -75, -2, -43, 7, -81, 63, 127, 125, -119, 66, -76, 90, -112, 63, 126, 53, -43, -49, -43, -64, -68, 63, 124, -35, 45, -61, 6, -48, 84, 63, 123, 116, 111, -23, 113, -12, 14, 63, 121, -4, -112, -119, -48, 120, -44, 63, 120, 118, -125, -22, -37, -85, -115, 63, 118, -29, 78, 110, 120, 2, -58, 63, 117, 67, -9, 37, -69, -47, 82, 63, 115, -103, -113, -34, -124, -37, 28, 63, 113, -27, 50, 116, 70, 120, -32, 63, 112, 39, -10, 19, 66, 39, 23, 63, 108, -58, 9, 100, 44, -48, 67, 63, 105, 46, -5, 21, 52, -102, -111, 63, 101, -115, 31, -29, -96, 34, -10, 63, 97, -30, -53, -68, -84, 110, 51, 63, 92, 100, -70, -108, -69, -28, 71, 63, 84, -4, 91, -80, -86, -40, 48, 63, 75, 34, 118, -77, -95, -66, -67, 63, 56, -96, 78, -82, 82, -88, 7, -65, 19, -90, -61, 38, 68, -120, 38, -65, 65, 35, 55, -127, 101, 95, 25, -65, 79, -79, -59, -92, 40, 87, -89, -65, 87, 11, -75, 63, -24, 77, 92, -65, 94, 37, -102, 110, 85, -55, 10, -65, 98, -111, 33, -48, -32, 44, -47, -65, 101, -2, -86, 20, -111, 6, -93, -65, 105, 89, 87, -32, 16, -52, 86, -65, 108, -97, 39, -51, -6, 73, 93, -65, 111, -50, 38, -108, 19, 114, -50, -65, 113, 114, 53, -46, 116, -41, 109, -65, 114, -16, 26, 3, -30, 55, -61, -65, 116, 95, -29, -64, 89, 75, -9, -65, 117, -64, -68, 72, 69, 62, 35, -65, 119, 17, -30, 85, -96, 26, -110, -65, 120, 82, -100, -81, -7, -126, 98, -65, 121, -126, 60, -37, -88, -121, -55, -65, 122, -96, 36, 120, 47, 102, -96, -65, 123, -85, -67, 50, -91, -17, -109, -65, 124, -92, -128, -45, 79, 28, -12, -65, 125, -119, -2, -101, -4, -53, 66, -65, 126, 91, -59, -50, -128, -41, 0, -65, 127, 25, -128, -124, -97, -73, 107, -65, 127, -62, -34, 54, -127, -100, 77, -65, -128, 43, -47, -22, -18, -53, -48, -65, -128, 107, -48, -120, -103, 22, 60, -65, -128, -95, 89, -127, 123, -107, -93, -65, -128, -52, 102, 31, -103, -93, 85, -65, -128, -20, -14, 92, 40, 116, -23, -65, -127, 3, 6, 68, -67, -97, 50, -65, -127, 14, -85, 62, -121, -91, 37 ],
					"saved_bundle_length" : 1184,
					"text" : "/filt : [-0.00832876, -0.00830655, -0.00826444, -0.00820236, -0.00812025, -0.00801814, -0.00789608, -0.0077542, -0.00759268, -0.00741174, -0.00721168, -0.00699282, -0.00675558, -0.00650038, -0.00622772, -0.00593816, -0.00563229, -0.00531076, -0.00497426, -0.00462351, -0.00425931, -0.00388248, -0.00349386, -0.00309436, -0.00268491, -0.00226647, -0.00184002, -0.0014066, -0.000967237, -0.000522997, -7.49642e-05, 0.000375766, 0.000828083, 0.00128087, 0.001733, 0.00218334, 0.00263077, 0.00307416, 0.0035124, 0.00394436, 0.00436897, 0.00478512, 0.00519177, 0.00558787, 0.0059724, 0.00634438, 0.00670284, 0.00704687, 0.00737556, 0.00768808, 0.00798361, 0.00826137, 0.00852066, 0.00876079, 0.00898113, 0.00918112, 0.00936023, 0.00951798, 0.00965398, 0.00976786, 0.00985932, 0.00992813, 0.00997411, 0.00999712, 0.00999712, 0.00997411, 0.00992813, 0.00985932, 0.00976786, 0.00965398, 0.00951798, 0.00936023, 0.00918112, 0.00898113, 0.00876079, 0.00852066, 0.00826137, 0.00798361, 0.00768808, 0.00737556, 0.00704687, 0.00670284, 0.00634438, 0.0059724, 0.00558787, 0.00519177, 0.00478512, 0.00436897, 0.00394436, 0.0035124, 0.00307416, 0.00263077, 0.00218334, 0.001733, 0.00128087, 0.000828083, 0.000375766, -7.49642e-05, -0.000522997, -0.000967237, -0.0014066, -0.00184002, -0.00226647, -0.00268491, -0.00309436, -0.00349386, -0.00388248, -0.00425931, -0.00462351, -0.00497426, -0.00531076, -0.00563229, -0.00593816, -0.00622772, -0.00650038, -0.00675558, -0.00699282, -0.00721168, -0.00741174, -0.00759268, -0.0077542, -0.00789608, -0.00801814, -0.00812025, -0.00820236, -0.00826444, -0.00830655, -0.00832876]",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 296.0, 456.0, 197.0, 20.0 ],
					"text" : "o.if length(/stream/x) == length(/filt)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 296.0, 264.0, 59.0, 20.0 ],
					"text" : "o.pack /x"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 319.0, 451.0, 968.0, 451.0, 968.0, 329.0, 336.5, 329.0 ],
					"source" : [ "obj-50", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "o.firfilter.maxpat",
				"bootpath" : "/Users/john/Development/Cascade/src",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.in.maxpat",
				"bootpath" : "/Users/john/Development/CNMAT/CNMAT/CNMAT-odot/dev",
				"patcherrelativepath" : "../../CNMAT/CNMAT/CNMAT-odot/dev",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.port.maxpat",
				"bootpath" : "/Users/john/Development/CNMAT/CNMAT/CNMAT-odot/dev",
				"patcherrelativepath" : "../../CNMAT/CNMAT/CNMAT-odot/dev",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.aspect.joinpoint.maxpat",
				"bootpath" : "/Users/john/Development/CNMAT/CNMAT/CNMAT-odot/dev/aspect",
				"patcherrelativepath" : "../../CNMAT/CNMAT/CNMAT-odot/dev/aspect",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.out.maxpat",
				"bootpath" : "/Users/john/Development/CNMAT/CNMAT/CNMAT-odot/dev",
				"patcherrelativepath" : "../../CNMAT/CNMAT/CNMAT-odot/dev",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.pack.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.if.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.compose.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.expr.codebox.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.union.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.route.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.select.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.context.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.collect.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.var.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.prepend.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.cond.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
