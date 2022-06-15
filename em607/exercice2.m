function exercice2(freqRange, freqLower, freqUpper, m, c, k, wn)
    fileType = 'png';
    legendLocation = "southeast";
    pPath = 'C:\Users\Admin-PC\Documents\gitRepos\classes\em607\images';
    pSize = [0 0 18 18];



    omega = freqRange(1):freqRange(2):freqRange(3);
    recpt = eval(receptivity(m, c, k));

    recptLower  = abs( 1/k * ones(size(freqLower)) );
    recptUpper  = abs( 1./(freqUpper.^2 .* m) );


    figure;
    loglog(omega, abs(recpt), freqLower, recptLower, '--', freqUpper, recptUpper, '--')

    titleText  = ['Magnitude Receptância \alpha(\omega)'];
    legendText = [append("Receptância, wn = ", num2str(wn)), "Assíntota \omega  \rightarrow 0", "Assíntota \omega \rightarrow \infty"];
    saveName = append('receptivityAbs', num2str(wn));
    xLabel = '\omega [rad/s]'; yLabel = '\alpha(\omega)';

    title(titleText,  'Interpreter','tex'); grid on; 
    legend(legendText, "location", legendLocation, 'Interpreter', 'tex')
    xlabel(xLabel); ylabel(yLabel); set(gcf, 'PaperPosition', pSize); 
    saveas(gca, fullfile(pPath, saveName), fileType);

    H = tf([(+1)],[(-1*m) (1i*c) (k)]);
    figure; bode(H)
    saveName = append('receptivityBode', num2str(wn)); grid on; 
    legend(legendText, "location", legendLocation, 'Interpreter', 'tex');
    set(gcf, 'PaperPosition', pSize); saveas(gca, fullfile(pPath, saveName), fileType);


    figure; loglog(omega, angle(recpt))

    titleText  = ['Ângulo Receptância \alpha(\omega)']; 
    legendText = [append("Receptância, wn = ", num2str(wn))]; 
    saveName = append('receptivityAngle', num2str(wn));
    xLabel = 'w [rad/s]'; yLabel = '\alpha(\omega)';

    title(titleText,  'Interpreter','tex'); grid on; 
    legend(legendText, "location", legendLocation, 'Interpreter', 'tex')
    xlabel(xLabel); ylabel(yLabel); set(gcf, 'PaperPosition', pSize); 
    saveas(gca, fullfile(pPath, saveName), fileType);
end