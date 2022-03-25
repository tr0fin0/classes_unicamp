function customizeFigure(title, xlabel, ylabel, fsize, fpath, fname)
    %% customizeFigure:
    %  Change Figure Caracteristics
    
    title(title);
    xlabel(xlabel);
    ylabel(ylabel);
    
    set(gcf, 'PaperPosition', fsize);
    saveas(gca, fullfile(fpath, fname), 'png');

end