
Select *
From PortfolioProject.dbo.Covid_Death
where continent is not null
order by 3,4

--Select *
--From PortfolioProject..Covid_Vaccinations
--order by 3,4

-- select data we are going to use

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject.dbo.Covid_Death
where continent is not null
order by 1,2

-- Looking at total cases vs total Deaths
-- show the likelihood of dying if you contract covid in your country 
Select Location, date, total_cases, total_deaths, (convert (DECIMAL(15,3), total_deaths) / convert (DECIMAL(15,3), total_cases))*100 as DeathPewrcentage
From PortfolioProject.dbo.Covid_Death
where location like '%ind%' and continent is not null
order by 1,2

--Looking for total cases vs Populations
-- shows what percentage of populations got covid
Select Location, date, total_cases, total_deaths, (convert (DECIMAL(15,3), total_cases) / convert (DECIMAL(15,3), population))*100 as  PercentagePopulationInfected
From PortfolioProject.dbo.Covid_Death
where location like '%ind%' and continent is not null
order by 1,2

--Looking for Countries with highest Infection Rate compared to populations 
Select Location, population, max(total_cases) as HigestInfectedCount,  max((convert (DECIMAL(15,3), total_cases) / convert (DECIMAL(15,3), population)))*100 as PercentagePopulationInfected
From PortfolioProject.dbo.Covid_Death
where continent is not null
group by location, population
order by 1,2

-- Showing Countries with Highest Death Count per Populations 

Select Location, MAX(cast (total_deaths as INT)) as TotalDeathCount
from PortfolioProject.dbo.Covid_Death
where continent is not null
group by location
order by TotalDeathCount desc

-- LET'S Breaking things by Continents

--showing continents with the highest death count per populations 
Select continent, MAX(cast (total_deaths as INT)) as TotalDeathCount
from PortfolioProject.dbo.Covid_Death
where continent is not null
group by continent
order by TotalDeathCount desc

-- Global Numbers

Select sum(new_cases) as total_cases, sum(cast (new_deaths as int)) as total_deaths, sum(cast (new_deaths as int)) / sum( nullif(new_cases, 0) )*100 
as  DeathPercentage
From PortfolioProject.dbo.Covid_Death
where continent is not null
--group by date
order by 1,2

--Looking at total populations vs vaccinations
select de.continent, de.location, de.date, de.population, va.new_vaccinations, 
sum(cast(va.new_vaccinations as decimal)) OVER(Partition by de.location order by de.location, de.date)
as peoplevaccinated
From PortfolioProject..Covid_Death de 
Join PortfolioProject..Covid_Vaccinations va 
on va.location = de.location and va.date = de.date
where de.continent is not null
order by 2,3


-- CTE

with popVSvac (continent, location, date, population, new_vaccinations, peoplevaccinated)
as
(
select de.continent, de.location, de.date, de.population, va.new_vaccinations, 
sum(cast(va.new_vaccinations as decimal)) OVER(Partition by de.location order by de.location, de.date)
as peoplevaccinated
From PortfolioProject..Covid_Death de 
Join PortfolioProject..Covid_Vaccinations va 
on va.location = de.location and va.date = de.date
where de.continent is not null
--order by 2,3
)
select *, (peoplevaccinated/population)*100 
from popVSvac

-- Temp table

Create Table #percentagePopulationVaccination
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
peoplevaccinated numeric
)

insert into #percentagePopulationVaccination
select de.continent, de.location, de.date, de.population, va.new_vaccinations, 
sum(cast(va.new_vaccinations as decimal)) OVER(Partition by de.location order by de.location, de.date)
as peoplevaccinated
From PortfolioProject..Covid_Death de 
Join PortfolioProject..Covid_Vaccinations va 
on va.location = de.location and va.date = de.date
where de.continent is not null
--order by 2,3
select *, (peoplevaccinated/population)*100 
from #percentagePopulationVaccination
