{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 9,
			"architecture" : "x86"
		}
,
		"rect" : [ 615.0, 44.0, 844.0, 864.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "FullPacket" ],
					"patching_rect" : [ 32.0, 248.0, 300.0, 20.0 ],
					"text" : "o.route /o_aspect_joinpoint /o_aspect /o_port /o_outlet"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-5",
					"linecount" : 37,
					"maxclass" : "o.display",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 32.0, 288.0, 768.0, 523.0 ],
					"text" : "/was/time/network : 2014-11-10T22:01:20.585036Z,\n/inputs/analogue : [0.589305, 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.],\n/port : 6000,\n/self/prefix : \"/0\",\n/self/id : 0,\n/time/network : 2014-11-10T22:01:20.586013Z,\n/counter : 37799,\n/time : 2014-11-10T22:01:20.592968Z,\n/time/relative : 227.647,\n/was/time : 2014-11-10T22:01:20.587982Z,\n/filt : [0.00722705, -4.71193e-18, -0.0113682, -0.025647, -0.040819, -0.0543643, -0.063662, -0.0664452, -0.0612286, -0.0476301, -0.0265258, 7.0679e-18, 0.0289082, 0.0566271, 0.0795775, 0.094715, 0.1, 0.094715, 0.0795775, 0.0566271, 0.0289082, 7.0679e-18, -0.0265258, -0.0476301, -0.0612286, -0.0664452, -0.063662, -0.0543643, -0.040819, -0.025647, -0.0113682, -4.71193e-18, 0.00722705],\n/fs : 200,\n/addresses/inputs/analogue : [\"/ecg/raw\", \"/ecg/leadoff/leftarm\", \"/ecg/leadoff/rightarm\", \"/inputs/analogue/4\", \"/inputs/analogue/5\", \"/inputs/analogue/6\", \"/inputs/analogue/7\", \"/inputs/analogue/8\", \"/inputs/analogue/9\", \"/inputs/analogue/10\", \"/inputs/analogue/11\", \"/inputs/analogue/12\", \"/inputs/analogue/13\", \"/inputs/analogue/14\", \"/inputs/analogue/15\", \"/inputs/analogue/16\"],\n/ecg/raw : 0.589305,\n/ecg/leadoff/leftarm : 0.,\n/ecg/leadoff/rightarm : 0.,\n/inputs/analogue/4 : 0.,\n/inputs/analogue/5 : 0.,\n/inputs/analogue/6 : 0.,\n/inputs/analogue/7 : 0.,\n/inputs/analogue/8 : 0.,\n/inputs/analogue/9 : 0.,\n/inputs/analogue/10 : 0.,\n/inputs/analogue/11 : 0.,\n/inputs/analogue/12 : 0.,\n/inputs/analogue/13 : 0.,\n/inputs/analogue/14 : 0.,\n/inputs/analogue/15 : 0.,\n/inputs/analogue/16 : 0.,\n/xosc/time : 1900-01-01T00:00:00.000000Z",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 113.0, 152.0, 62.0, 20.0 ],
					"text" : "o.pack /id"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 32.0, 184.0, 50.0, 20.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 32.0, 216.0, 125.0, 20.0 ],
					"text" : "o.if /self/id == /id ?? 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-9",
					"items" : [ 0, ",", 1, ",", 2, ",", 3, ",", 4, ",", 5, ",", 6, ",", 7, ",", 8, ",", 9, ",", 10, ",", 11, ",", 12, ",", 13, ",", 14, ",", 15 ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 72.5, 120.0, 100.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 32.0, 120.0, 32.5, 20.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 32.0, 88.0, 291.0, 20.0 ],
					"text" : "o.if /o_outlet/this/patcher/name == o.io.dispatch.xosc"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 32.0, 56.0, 143.0, 20.0 ],
					"text" : "o.if /o_port/type == outlet"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 32.0, 24.0, 98.0, 20.0 ],
					"text" : "o.aspect.receive"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 1 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "o.aspect.receive.maxpat",
				"bootpath" : "/Users/john/Development/CNMAT/CNMAT/CNMAT-odot/dev/aspect",
				"patcherrelativepath" : "../../CNMAT/CNMAT/CNMAT-odot/dev/aspect",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.if.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.union.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.pack.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.display.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.route.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
