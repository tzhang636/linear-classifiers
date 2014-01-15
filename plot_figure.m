%%
% Description
% 
%   This function plots multiple data series in the same figure. You are
%   free to modify it as you see fit, particularly if you are familiar with
%   Matlab; we include it as a courtesy to students who might be unfamiliar
%   with the software.
%   
%   See plot_mistakes.m and tune_eta.m for example use cases.
%%
% Input
%
% index:    an identification number for the graph (e.g. 1, 2, 3)
% desc:     the graph's title
% x_lbl:    description of the independent axis
% y_lbl:    description of the dependent axis
% fields:   a cell array containing the labels in the legend
% data:     each row in this matrix is a series of values 
%           (e.g. the number of mistakes made during training)
function plot_figure(index, desc, x_lbl, y_lbl, fields, data)
  [num_fields, x_max] = size(data);
  
  % Check that sizes match
  if length(fields) ~= num_fields
    error('Number of labels in legend does not match number of data series') 
  end
  
  % Get colors; for small plots (few fields), try to avoid red-green 
  % colorblindess issues.
  % For plots with many fields, generate random colors and hope for the best.
  colors = varycolor(num_fields);
  
  % Plot graph and legend
  % Note: you can reposition the legend by clicking and dragging your mouse
  grid on;
  hold off;
  figure(index);
  for i = 1:num_fields
    plot(data(i,:),'LineWidth',1.7, 'Color', colors(i, :));    
    hold on;
  end
  title(desc);
  xlabel(x_lbl);
  ylabel(y_lbl);
  legend(fields, 'Location','NorthWest');
end
