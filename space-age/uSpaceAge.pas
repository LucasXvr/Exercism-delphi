unit uSpaceAge;
interface
type
  ISpaceAge = interface
    function OnEarth: Double;
    function OnMercury: Double;
    function OnVenus: Double;
    function OnMars: Double;
    function OnJupiter: Double;
    function OnSaturn: Double;
    function OnUranus: Double;
    function OnNeptune: Double;
  end;
  TSpaceAge = class(TInterfacedObject, ISpaceAge)
  private
    FDays,
    FSeconds: Double;
    function Round(AValue: Double): Double;
  public
    constructor Create(ASeconds: Double);
    function OnEarth: Double;
    function OnMercury: Double;
    function OnVenus: Double;
    function OnMars: Double;
    function OnJupiter: Double;
    function OnSaturn: Double;
    function OnUranus: Double;
    function OnNeptune: Double;
  end;
function NewSpaceAge(ASeconds: Double): ISpaceAge;
const
  EARTH_DAYS = 365.25;
	MERCURY_EARTH_YEARS = 0.2408467;
	VENUS_EARTH_YEARS = 0.61519726;
	MARS_EARTH_YEARS = 1.8808158;
	JUPITER_EARTHYEARS = 11.862615;
	SATURN_EARTH_YEARS = 29.447498;
	URANUS_EARTH_YEARS = 84.016846;
	NEPTUNE_EARTH_YEARS = 164.79132;
implementation
uses
  System.Math;
function NewSpaceAge(ASeconds: Double): ISpaceAge;
begin
  Result := TSpaceAge.Create(ASeconds);
end;
{ TSpaceAge }
constructor TSpaceAge.Create(ASeconds: Double);
begin
  FDays := (((ASeconds / 60) / 60) / 24);
  FSeconds := ASeconds;
end;
function TSpaceAge.OnEarth: Double;
begin
  Result := Self.Round(FDays / EARTH_DAYS);
end;
function TSpaceAge.OnJupiter: Double;
begin
  Result := Self.Round(OnEarth / JUPITER_EARTHYEARS);
end;
function TSpaceAge.OnMars: Double;
begin
  Result := Self.Round(OnEarth / MARS_EARTH_YEARS);
end;
function TSpaceAge.OnMercury: Double;
begin
  Result := Self.Round(OnEarth / MERCURY_EARTH_YEARS);
end;
function TSpaceAge.OnNeptune: Double;
begin
  Result := Self.Round(OnEarth / NEPTUNE_EARTH_YEARS);
end;
function TSpaceAge.OnSaturn: Double;
begin
  Result := Self.Round(OnEarth / SATURN_EARTH_YEARS);
end;
function TSpaceAge.OnUranus: Double;
begin
  Result := Self.Round(OnEarth / URANUS_EARTH_YEARS);
end;
function TSpaceAge.OnVenus: Double;
begin
  Result := Self.Round(OnEarth / VENUS_EARTH_YEARS);
end;
function TSpaceAge.Round(AValue: Double): Double;
begin
  Result := RoundTo(RoundTo(AValue, -3), -2);
end;
end.
