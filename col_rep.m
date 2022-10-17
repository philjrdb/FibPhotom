function col = col_rep(n)

%% Colour repository
%Order so that list can be drawn from sequentially
% (1)Blue: [0 0.4 0.8]
% (2)Red: [0.8 0 0]
% (3)Green: [0 0.6 0]
% (4)Orange: [1 0.4 0]
% (5)Yellow: [1 0.8 0]
% (6)Purple: [0.7 0 0.7]
% (7)Light blue: [0 0.6 1]
% (8)Grey: [0.4 0.4 0.4]
% (9)Chrome: [0.8 0.8 0.2]
% (10)Light Green: [0 0.8 0]
% (11)Turquoise: [0.2 0.8 0.8]
% (12)Darker green: [0 0.4 0]
% (13)Light purple: [0.8 0.2 0.8]
% (14)Light grey: [0.6 0.6 0.6]
% (15)Fuschia: [0.8 0.2 0.5]
% (16)Pastel blue: [0.44 .82 .84]
% (17)Pastel green: [.57 .82 .57]
% (18)Pastel purple: [.65 .54 .76]
% (19)Pastel yellow: [1 .93 .32]
% (20)Pastel teal: [.28 .71 .64]
% (21)Pun red: [.78 0.12 0.12]
% (22)Pun blue: [0.15 0.4 .71];
% (23)Pun green: [0 .55 0]
% (24)Pun teal: [0 .75 .75]
% (25) Runway orange: [.98 .50 .03]
% (26) Runway blue: [.4 .8 1]
% (27) Runway red: [.49 0 .01]

%% Swatch test: plot([0 0 1],[1 1 0],'Color',[0.8 0.2 0.5], 'LineWidth', 100)

col_matr = [0 0.4 0.8;
            0.8 0 0;
            0 0.6 0;
            1 0.4 0;
            1 0.8 0;
            0.7 0 0.7;
            0 0.6 1;
            0.4 0.4 0.4;
            0.8 0.8 0.2;
            0 0.8 0;
            0.2 0.8 0.8;
            0 0.4 0;
            0.8 0.2 0.8;
            0.6 0.6 0.6;
            0.8 0.2 0.5;
            0.44 .82 .84;
            .57 .82 .57;
            .65 .54 .76;
            1 .93 .32;
            .28 .71 .64;
            .78 0.12 0.12;
            0.15 0.4 .71;
            0 .55 0;
            0 .75 .75; 
            .98 .50 .03;
            .4 .8 1;
            .49 0 .01];

col = col_matr(n,:);

end