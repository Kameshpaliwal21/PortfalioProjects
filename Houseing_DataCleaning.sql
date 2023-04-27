-- Cleaning data in sql Query 

select * from PortfolioProject.dbo.HouseingData

-------------------------------------------------------------

-- Standardize Date Formet

select SaleDateConverter, CONVERT(date,SaleDate)
from PortfolioProject.dbo.HouseingData

Update HouseingData 
set SaleDate = CONVERT(date,SaleDate)

Alter Table HouseingData 
Add SaleDateConverter Date

Update HouseingData 
set SaleDateConverter = CONVERT(date,SaleDate)

----------------------------------------------------------

-- populate Propoerty Address data

select *
from PortfolioProject.dbo.HouseingData
--where PropertyAddress is Null
order by ParcelID

Select a.ParcelID,a.PropertyAddress, b.ParcelID,b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject.dbo.HouseingData a
Join PortfolioProject.dbo.HouseingData b
on a.ParcelID = b.ParcelID
And a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is Null

Update a
Set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject.dbo.HouseingData a
Join PortfolioProject.dbo.HouseingData b
on a.ParcelID = b.ParcelID
And a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is Null

---------------------

--Breaking out Address into Indivisual Coloumn (Addess, City, State )

select PropertyAddress
from PortfolioProject.dbo.HouseingData
--where PropertyAddress is Null
--order by ParcelID

Select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)  ) As Address
From PortfolioProject.dbo.HouseingData

Select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1) As Address,
SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress)) As Address
From PortfolioProject.dbo.HouseingData

Alter Table PortfolioProject.dbo.HouseingData 
Add PropoertySplitAddess Nvarchar(255)

Update PortfolioProject.dbo.HouseingData
set PropoertySplitAddess = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1)


Alter Table PortfolioProject.dbo.HouseingData
Add PropoertyCity Nvarchar(255)

Update PortfolioProject.dbo.HouseingData
set PropoertyCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress))

Select * 
From PortfolioProject.dbo.HouseingData

Select OwnerAddress
From PortfolioProject.dbo.HouseingData

Select 
PARSENAME(Replace(OwnerAddress, ',','.'),3),
PARSENAME(Replace(OwnerAddress, ',','.'),2),
PARSENAME(Replace(OwnerAddress, ',','.'),1)
From PortfolioProject.dbo.HouseingData


Alter Table PortfolioProject.dbo.HouseingData 
Add OwnerSplitAddess Nvarchar(255)

Update PortfolioProject.dbo.HouseingData
set OwnerSplitAddess = PARSENAME(Replace(OwnerAddress, ',','.'),3)


Alter Table PortfolioProject.dbo.HouseingData
Add OwnerSplitCity Nvarchar(255)

Update PortfolioProject.dbo.HouseingData
set OwnerSplitCity  = PARSENAME(Replace(OwnerAddress, ',','.'),2)

Alter Table PortfolioProject.dbo.HouseingData
Add OwnerSplitState Nvarchar(255)

Update PortfolioProject.dbo.HouseingData
set OwnerSplitState  = PARSENAME(Replace(OwnerAddress, ',','.'),1)

Select * 
From PortfolioProject.dbo.HouseingData


------------------------------------------------------------------------------

-- Change Y and N to yes and No in 'Sold as Vacent' Field

Select distinct(SoldAsVacant), count(SoldAsVacant)
From PortfolioProject.dbo.HouseingData
group by SoldAsVacant
order by 2 

Select SoldAsVacant,
Case When SoldAsVacant = 'Y' then 'Yes'
	 When SoldAsVacant = 'N' then 'No'
	 Else SoldAsVacant
	 END
From PortfolioProject.dbo.HouseingData

Update PortfolioProject.dbo.HouseingData
Set SoldAsVacant = Case When SoldAsVacant = 'Y' then 'Yes'
	 When SoldAsVacant = 'N' then 'No'
	 Else SoldAsVacant
	 END

-------------------------------------------------------------------------

-- Remove Duplocates

With RowNumCTE As (
Select * ,
Row_Number() Over(
Partition by ParcelID,
			 PropertyAddress,
			 SalePrice,
			 SaleDate,
			 LegalReference
			 order by 
				UniqueID)
				row_num
From PortfolioProject.dbo.HouseingData
)
Select * 
From RowNumCTE
where row_num >1
order by PropertyAddress

Select *
From PortfolioProject.dbo.HouseingData