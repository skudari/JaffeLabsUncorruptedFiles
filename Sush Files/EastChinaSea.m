  envfil = 'EastChinaSea';
  model  = 'BELLHOP';
  TitleEnv = 'East China Sea';
  freqT = [230.0];

  SSP.NMedia = 1;
  
  
  SSP.N      = [ 500 1000 ];
  SSP.sigma  = [   0    0 ];
  SSP.depth  = [ 0  2000 ];
  SSP.sigma = soundSpeed(:);
  SSP.depth = depth(:); % soundSpeed(:)
%   
%   SSP.raw( 1 ).z      = depth(:);
%   SSP.raw( 1 ).alphaR = soundSpeed(:);
%   SSP.raw( 1 ).betaR  = [ 0 0 ];
%   SSP.raw( 1 ).rho    = [ 1 1 ];
%   SSP.raw( 1 ).alphaI = [ 0 0 ];
%   SSP.raw( 1 ).betaI  = [ 0 0 ];
  RMax        = 0.0;
  Bdry.Top.Opt   = 'CVW';
  Bdry.Bot.Opt   = ' ';
  Bdry.Bot.sigma = 0.0;

  Pos.s.depth = 0.0;
  Pos.r.depth = linspace( 0, 2000, 2001 );
  Pos.r.range = 0:100;

  Beam.RunType    = 'R';
  Beam.Nbeams     = 0;
  Beam.alpha( 1 ) = -15;
  Beam.alpha( 2 ) = +15;
  Beam.Box.z      = 1.05 * max( Pos.r.depth );
  Beam.Box.r      = 1.05 * RMax;
  Beam.deltas     = 0; 
  
  
 write_env( envfil, model, TitleEnv, freqT, SSP, Bdry, Pos, Beam, cInt, RMax );
 write_bell(envfil, Beam)

runbellhop = which( 'bellhop.exe' );
eval( [ '! "' runbellhop '" ' envfil ] );

% bellhop( 'EastChinaSea' )
% figure
% plotray( 'EastChinaSea' )
% plotbty 'EastChinaSea'

   