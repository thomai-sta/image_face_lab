function b_vec = VecBoxSum(x, y, w, h, W, H)

%% Function VecBoxSum:
%  Input: x, y: coordinates of the top left corner of the rectangular
%         w, h: width and height of rectangular
%         W, H: width and height if the integral image
%  Output: b_vec: row vector with 4 non-zero elements, such as: b_vec * ii_im(:)
%                 results inthe sum of the pixels intensities of the rectangular
%  NOTE: notation used as in: https://computersciencesource.wordpress.com/2010/09/03/computer-vision-the-integral-image/
%  A = [x, y];
%  B = [x + w, y];
%  C = [x, y + h];
%  D = [x + w, y + h];
%  Summed area is: A + D - B -C, where A = ii_im(A) etc.

b_vec = zeros(1, W * H);

%% Convert 2d coordinates to 1d
b_vec(sub2ind([H, W], x - 1, y - 1)) = 1;         % +A
b_vec(sub2ind([H, W], x + w - 1, y - 1)) = -1;    % -B
b_vec(sub2ind([H, W], x - 1, y + h - 1)) = -1;    % -C
b_vec(sub2ind([H, W], x + w - 1, y + h - 1)) = 1; % +D