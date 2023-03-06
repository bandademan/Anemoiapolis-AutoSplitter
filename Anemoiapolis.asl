state("AnemoiapolisChapter1") {}

startup {

	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
	vars.Helper.GameName = "AnemoiapolisChapter1";
	
}

init {

	vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
	{
		vars.Helper["state"] = mono.Make<SystemManager.GameState>("SystemManager", 1, "Instance", "state");

		return true;
	});

}

start {

	return 

}

split {

	return

}

isLoading {

	return state == Enum.GetName(typeof(SystemManager.GameState), (int) state)

}