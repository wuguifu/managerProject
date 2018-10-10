function main(){
		var graph;
		//console.log( $("#xmlDoc").val());
		mxConnectionHandler.prototype.connectImage = new mxImage('src/images/connector.gif', 16, 16);
	
		if (!mxClient.isBrowserSupported())
		{
			mxUtils.error('Browser is not supported!', 200, false);
		}
		else
		{
			var tbContainer = document.createElement('div');
			tbContainer.style.position = 'absolute';
			tbContainer.style.overflow = 'hidden';
			tbContainer.style.padding = '2px';
			tbContainer.style.left = '0px';
			tbContainer.style.top = '0px';
			tbContainer.style.width = '25px';
			tbContainer.style.bottom = '0px';
			
			document.body.appendChild(tbContainer);
	
			var toolbar = new mxToolbar(tbContainer);
			toolbar.enabled = false;
			
			container = document.createElement('div');
			container.style.position = 'absolute';
			container.style.overflow = 'hidden';
			container.style.left = '25px';
			container.style.top = '0px';
			container.style.right = '0px';
			container.style.bottom = '0px';
			//container.style.background = '#F9F9F9';
			container.style.background = 'url("src/images/grid.gif")';
	
			document.body.appendChild(container);
			
			if (mxClient.IS_QUIRKS)
			{
				document.body.style.overflow = 'hidden';
				new mxDivResizer(tbContainer);
				new mxDivResizer(container);
			}
	
			var model = new mxGraphModel();
			graph = new mxGraph(container, model);
			graph.dropEnabled = true;
			/*Style---设置*/
			var style = graph.getStylesheet().getDefaultVertexStyle();
			style[mxConstants.STYLE_SHAPE] = mxConstants.SHAPE_RHOMBUS;
			style[mxConstants.STYLE_PERIMETER] = mxPerimeter.RhombusPerimeter;
			style[mxConstants.STYLE_STROKECOLOR] = '#91BCC0';
			style[mxConstants.STYLE_FONTCOLOR] = 'gray';
			style[mxConstants.STYLE_FILLCOLOR] = '#91BCC0';
			style[mxConstants.STYLE_ROUNDED] = true;
			style[mxConstants.STYLE_SHADOW] = true;
			style[mxConstants.STYLE_GRADIENTCOLOR] = 'white';
			style[mxConstants.STYLE_ALIGN] = mxConstants.ALIGN_CENTER;
			style[mxConstants.STYLE_VERTICAL_ALIGN] = mxConstants.ALIGN_MIDDLE;
			style[mxConstants.STYLE_FONTSIZE] = 16;
		
			style = graph.getStylesheet().getDefaultEdgeStyle();
			style[mxConstants.STYLE_EDGE] = mxEdgeStyle.OrthConnector;
			style[mxConstants.STYLE_STROKECOLOR] = '#808080';
			style[mxConstants.STYLE_ROUNDED] = true;
			//style[mxConstants.STYLE_SHADOW] = true;
			
			// Stops editing on enter or escape keypress
			var keyHandler = new mxKeyHandler(graph);
			var rubberband = new mxRubberband(graph);
			//=======================================================================
			// Helper method that returns the fieldname to be used for
			// a mouse event
			var getFieldnameForEvent = function(cell, evt)
			{
				if (evt != null)
				{
					// Finds the relative coordinates inside the cell
					var point = mxUtils.convertPoint(graph.container,
							evt.clientX, evt.clientY);
					var state = graph.getView().getState(cell);
					
					if (state != null)
					{
						point.x -= state.x;
						point.y -= state.y;
						
						// Returns second if mouse in second half of cell
						if (point.y > state.height / 2)
						{	
							return 'first';
						}
					}
				}
				
				return 'first';
			};					
			// Returns a HTML representation of the cell where the
			// upper half is the first value, lower half is second
			// value
							// Sample user objects with 2 fields
			var value = new Object();
			value.first = '未配置';
			value.second = "";
			graph.getLabel = function(cell)
			{
				var table = document.createElement('table');
				table.style.height = '100%';
				table.style.width = '100%';
				
				var body = document.createElement('tbody');
				var tr1 = document.createElement('tr');
				var td1 = document.createElement('td');
				td1.style.fontSize = '12px';
				if(cell.value!=null){
					mxUtils.write(td1, cell.value.first);
				}
				
				var tr2 = document.createElement('tr');
				var td2 = document.createElement('td');
				td2.style.fontSize = '12px';
				if(cell.value!=null){
					mxUtils.write(td2, cell.value.second);
				}
				
				tr1.appendChild(td1);
				tr2.appendChild(td2);
				body.appendChild(tr1);
				body.appendChild(tr2);
				table.appendChild(body);
				
				return table;
			};
			// Returns the editing value for the given cell and event
			graph.getEditingValue = function(cell, evt)
			{
				evt.fieldname = getFieldnameForEvent(cell, evt);
				return cell.value[evt.fieldname] || '';
			};
							
			// Sets the new value for the given cell and trigger
			graph.labelChanged = function(cell, newValue, trigger)
			{
				var name = (trigger != null) ? trigger.fieldname : null;
				
				if (name != null)
				{
					// Clones the user object for correct undo and puts
					// the new value in the correct field.
					var value = mxUtils.clone(cell.value);
					value[name] = newValue;
					newValue = value;
					mxGraph.prototype.labelChanged.apply(this, arguments);
				}
			};						
			
			//////////////////////////////////////////////////////////////////////////
			var xml = $("#xmlDoc").val();
			var doc = mxUtils.parseXml(xml);
			var codec = new mxCodec(doc);
			codec.decode(doc.documentElement, graph.getModel());
			
			
			var model = graph.getModel();
			var nodes = doc.documentElement.getElementsByTagName('mxCell');
			if (nodes != null &&
					nodes.length > 0)
				{
				
					model.beginUpdate();
					try
					{
						for (var i = 0; i < nodes.length; i++)
						{
							// Processes the activity nodes inside the process node
							var id = nodes[i].getAttribute('id');
							var state = nodes[i].getAttribute('status');
							var vertex = nodes[i].getAttribute('vertex');
							// Gets the cell for the given activity name from the model
							var cell = model.getCell(id);
							//console.log("id="+id+"|status="+state);
							// Updates the cell color and adds some tooltip information
							if (cell != null&&vertex!=null)
							{
								// Resets the fillcolor and the overlay
								//graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, 'white', [cell]);
								//graph.removeCellOverlays(cell);
		
								// Changes the cell color for the known states
								if (state == 'running')
								{
									graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#3A7EF3', [cell]);
								}
								else if (state == 'waitting')
								{
									graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#FFFF8C', [cell]);
								}
								else if (state == 'success')
								{
									graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, 'green', [cell]);
								}
								
								// Adds tooltip information using an overlay icon
								else if (state == 'fail')
								{
									// Sets the overlay for the cell in the graph
									graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, 'red', [cell]);
									//graph.addCellOverlay(cell, createOverlay(graph.warningImage, 'State: '+state));
								}
								else{
									graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, 'white', [cell]);
								}
							}
						} // for
					}
					finally
					{
						model.endUpdate();
					}
				}	
			
			function createOverlay(image, tooltip)
			{
				var overlay = new mxCellOverlay(image, tooltip);
	
				// Installs a handler for clicks on the overlay
				overlay.addListener(mxEvent.CLICK, function(sender, evt)
				{
					mxUtils.alert(tooltip + '\nLast update: ' + new Date());
				});
				
				return overlay;
			};				
			/////////////////////////////////////////////////////////////////////////
			mxDragSource.prototype.getDropTarget = function(graph, x, y)
			{
				var cell = graph.getCellAt(x, y);
				
				if (!graph.isValidDropTarget(cell))
				{
					cell = null;
				}
				
				return cell;
			};
	
			// Enables new connections in the graph
			graph.setConnectable(true);
			graph.setMultigraph(false);
			
			
			var addVertex = function(icon, w, h, style)
			{
				var vertex = new mxCell(value, new mxGeometry(0, 0, w, h), style);
				vertex.setVertex(true);
			
				addToolbarItem(graph, toolbar, vertex, icon);
			};
			
	
			toolbar.addLine();
			addVertex('src/images/rounded.gif', 150, 50, 'shape=rounded');
			toolbar.addLine();
			toolbar.addItem('delete', 'src/images/delete.png',function()
			{
				var cells = graph.getSelectionCells();
				graph.removeCells(cells);
	
			});
		}
	}

	function addToolbarItem(graph, toolbar, prototype, image)
	{
		var funct = function(graph, evt, cell)
		{
			graph.stopEditing(false);
	
			var pt = graph.getPointForEvent(evt);
			var vertex = graph.getModel().cloneCell(prototype);
			vertex.geometry.x = pt.x;
			vertex.geometry.y = pt.y;
			
			graph.setSelectionCells(graph.importCells([vertex], 0, 0, cell));
		}
	
		// Creates the image which is used as the drag icon (preview)
		var img = toolbar.addMode(null, image, funct);
		mxUtils.makeDraggable(img, graph, funct);
	}
		
