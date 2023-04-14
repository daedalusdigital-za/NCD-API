#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MH.Api/MH.Api.csproj", "MH.Api/"]
COPY ["MH.Infrastructure/MH.Infrastructure.csproj", "MH.Infrastructure/"]
COPY ["MH.Domain/MH.Domain.csproj", "MH.Domain/"]
COPY ["MH.Application/MH.Application.csproj", "MH.Application/"]
COPY ["Framework/Logistic.Framework.csproj", "Framework/"]
COPY ["Logistic.Service/Logistic.Service.csproj", "Logistic.Service/"]
RUN dotnet restore "MH.Api/MH.Api.csproj"
COPY . .
WORKDIR "/src/MH.Api"
RUN dotnet build "MH.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MH.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MH.Api.dll"]