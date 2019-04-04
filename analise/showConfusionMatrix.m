function showConfusionMatrix(C,protocol,test,strategy)
	C3=C;


	disp(strcat('Taxa de acerto: ',num2str(sum(diag(C))/sum(sum(C))))); 

	L = size(C,1);%Numbers class actions. 

	for i=1:L
	    C(i,:) = C(i,:)/sum(C(i,:))*100;
	end


	h = figure;
	rect = [20, 20, 650, 550];
	set(h,'OuterPosition',rect);

	grid on

	imagesc(C);
	colormap(gray);
	colormap(flipud(gray));
	colorbar

	set(gca,'XTick',1:20);
	set(gca,'XTickLabel',{'01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20' },  'FontSize', 8, 'FontWeight', 'bold');

	set(gca,'YTick',1:20);
	set(gca,'YTickLabel',{'High arm wave - 01', 'Horizontal arm wave - 02', 'Hammer - 03','Hand catch - 04','Forward punch - 05','High throw - 06','Draw x - 07','Draw tick - 08','Draw circle - 09','Hand clap - 10','Two hand wave - 11', 'Side boxing - 12','Bend - 13','Forward kick - 14','Side kick - 15','Jogging - 16','Tennis swing - 17','Tennis serve - 18','Golf swing - 19','Pickup & throw - 20'},  'FontSize', 9, 'FontWeight', 'bold');

	%Codigo para as matrizes de confusao relativas aos AS1,AS2 e AS3
	%set(gca,'XTick',1:L);
	%if(L==20)
	%sequence = {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20' };
	%elseif (L==8)
	%	sequence = {'01', '02', '03', '04', '05', '06', '07', '08'};	
	%end
	%set(gca,'XTickLabel',sequence,  'FontSize', 8, 'FontWeight', 'bold');

	%set(gca,'YTick',1:L);
	%if(a==1)
	%	sequence_actions = {'Horizontal arm wave - 01', 'Hammer - 02','Forward punch - 03','High throw - 04','Hand clap - 05','Bend - 06','Tennis serve - 07','Pickup & throw - 08'};
	%elseif(a==2)
	%	sequence_actions = {'High arm wave - 01','Hand catch - 02','Draw x - 03','Draw tick - 04','Draw circle - 05','Two hand wave - 06','Forward kick - 07','Side boxing - 18'};
	%elseif(a==3)
	%	sequence_actions = {'High throw - 01','Forward kick - 02','Side kick - 03','Jogging - 04','Tennis serve - 05','Tennis swing - 06','Golf swing - 07','Pickup & throw - 08'};
	%end
	%set(gca,'YTickLabel',sequence_actions,  'FontSize', 9, 'FontWeight', 'bold');

	xlabel('Predição', 'FontSize', 14, 'FontWeight', 'bold');
	ylabel('Ação real',  'FontSize', 14, 'FontWeight', 'bold');
	%axis equal;
	axis square;

	filename_image = strcat('mconfusao_p',num2str(protocol),'_t',num2str(test),'_s',num2str(strategy),'.png');
	%filename_save='mconfunsao.pdf';
	%set(gcf,'PaperPositionMode','auto'); 

	%print('-dpdf', filename_save);
	%[status, result] = system(['pdfcrop ' filename_save ' ' filename_save ]);

	print(h, '-dpng', filename_image); 