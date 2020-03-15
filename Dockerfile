FROM mcr.microsoft.com/dotnet/core/sdk AS build

RUN apt-get update -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash --debug
RUN apt-get install nodejs -yq

WORKDIR /app
COPY . .
RUN dotnet publish

FROM mcr.microsoft.com/dotnet/core/aspnet AS runtime
WORKDIR /app
COPY --from=build /app/bin/Debug/netcoreapp3.1/publish .

ENTRYPOINT ["dotnet", "SampleApp.dll"]
