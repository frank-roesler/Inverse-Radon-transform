function iRadon = inverse_radon_transform(sinogram,options)
%     Computes inverse Radon transform of an image.
    arguments
        sinogram double
        options.plotting logical = true
    end
    
    g = sinogram;
    angles = size(g,2);
    phi = linspace(0,pi, angles);
    delta_phi = 45/(length(phi)-1);
    l = size(g,1);
    t = linspace(-(l+1)/2,(l-1)/2,l);
    [X,Y] = meshgrid(t,t);
    
%     Compute fractional Laplacian using fft:
    Lambda = ifft(((l+1)/2 - abs(t))'.*fft(g,l,1),l,1);
    
    tvalues = zeros(l,l,angles);
    for p=1:length(phi)
        tvalues(:,:,p) = X.*cos(phi(p)) + Y.*sin(phi(p));
    end
    tvalues = tvalues - min(tvalues(:)) + 1;
    tn = tvalues/max(abs(tvalues(:)));
    tvalues = ceil(l*tn);
    
%     Compute adjoint Radon transform:
    Rhash = zeros(l);
    for p=1:length(phi)
        Rhash(:) = Rhash(:) + Lambda(tvalues(:,:,p),p);
    end
    Rhash = Rhash/l*delta_phi;
    
    iRadon = real(Rhash)/(4*pi);
    iRadon = flipud(min(iRadon,1));
    
    if options.plotting
        figure
        imshow(iRadon)
        title('Reconstruction')
    end
end