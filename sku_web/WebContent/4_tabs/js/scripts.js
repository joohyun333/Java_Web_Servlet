$(function(){


		// 1. 첫번째 패널만 보기에
		/*
		 * (1) a 요소를 화면에 보여주기
		 * (2) 
		 */
		var topDiv = $('.tabSet');
		var anchors = topDiv.find('ul.tabs a');
		var panelDivs = topDiv.find('div.panel');
		
		var lastAnchor = anchors.filter('.on');
		var lastPanel = $(lastAnchor.attr('href')); 
		
		anchors.show();
		panelDivs.hide();
		lastPanel.show();
		
		//------------------------------------------------------------
		// 2. 클릭하면 해당 패널 보기에
		anchors.click(function(event){
			//event.preventDefault();
			var currentAnchor = $(this);
			var currentPanel = $(currentAnchor.attr('href'));
				// 3.
				lastAnchor.removeClass('on');
				currentAnchor.addClass('on');
				
			lastPanel.hide();
			currentPanel.show();
				// 2.
			lastAnchor = currentAnchor;
			lastPanel = currentPanel;
		});

//	  클릭 이벤트 대신 아래 한 줄 코딩
//  $('.tabSet').tabs();
});
