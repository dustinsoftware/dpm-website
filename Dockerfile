FROM mcr.microsoft.com/dotnet/core/aspnet
LABEL name="zeitdotnet"

ARG source=.
WORKDIR /app
EXPOSE 3000
COPY $source .

ENTRYPOINT ["dotnet", "SampleApp.dll"]
