get_raw_data <- function() {
    # Check if file is up to date
    data_co2_filename <- paste("data_co2_raw_", Sys.Date(), ".csv", sep="")
    files_in_dir = list.files("data/raw")
    
    
    if (is.na(match(data_co2_filename, files_in_dir))) {
        # Download Dataset
        data_URL <- "https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv"
        data_co2_raw <- read.csv(file = data_URL, encoding = "Latin1")
        download.file(data_URL, "data_co2")
        
        # Delete Old
        unlink("data/raw/*")
        
        # Write Dataset
        write.csv(data_co2_raw, file = data_co2_filename)
        file.copy(data_co2_filename, "data/raw")
        
        
    
    } else {
        # Read Dataset
        data_co2_raw <- read.csv(file = data_co2_filename)
    }   
    
    return(data_co2_raw)
}


