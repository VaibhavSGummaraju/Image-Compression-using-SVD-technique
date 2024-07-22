RGB = imread('test1.jpg');
A = mat2gray(RGB);
A = rgb2gray(A);
A = imresize(A,[512 512]); [U, S, V] = svd(A);
k = 0;
Ak = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
subplot(1,2,1);
imagesc(A); colormap gray; axis image; title('Original image');
subplot(1,2,2);
imagesc(Ak); colormap gray; axis image; title('Compressed image');
figure(2)
sv = diag(S);
plot(sv),title('Singula Values of the Image'),xlabel('Index'),ylabel('Singular Value');
ssimval=ssim(Ak,A);
