#' app to survey 43000 cancer transcriptomes
#' @return a SummarizedExperiment
#' @note Copies source code and metadata to a temporary folder
#' and executes shiny::runApp there; sets working diretory to folder where
#' ca43kAnVIL was called
#' when app is exited.  Also will return either NULL or a
#' SummarizedExperiment at conclusion.
#' @examples
#' ca43kAnVIL
#' @export
ca43kAnVIL = function() {
 od = getwd()
 on.exit(setwd(od))
 uif = system.file("ca43kAnVIL/ui.R", package="HumanTranscriptomeCompendium")
 servf = system.file("ca43kAnVIL/server.R", package="HumanTranscriptomeCompendium")
 zipf = system.file("ca43k/ca1009.zip", package="HumanTranscriptomeCompendium")
 td = tempdir()
 setwd(td)
 file.copy(uif, ".", overwrite=TRUE)
 file.copy(servf, ".", overwrite=TRUE)
 file.copy(zipf, ".", overwrite=TRUE)
 shiny::runApp()
}
