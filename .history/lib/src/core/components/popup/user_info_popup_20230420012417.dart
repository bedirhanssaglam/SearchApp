import 'main_popup.dart';

userInfoPopup() {
  return mainPopup(
    context,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                BaseFunctions.instance.closePopup(context);
              },
              icon: const Icon(Icons.close),
            ),
          ),
          10.ph,
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              userImage!,
              width: context.dynamicWidth(0.2),
              height: context.dynamicHeight(0.1),
              fit: BoxFit.cover,
            ),
          ),
          20.ph,
          Text(
            widget.user.name ?? "",
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          5.ph,
          Text(widget.user.website ?? ""),
          20.ph,
          Row(
            children: [
              const Text("Email: "),
              Text(widget.user.email ?? ""),
            ],
          ),
          5.ph,
          Row(
            children: [
              const Text("Telefon: "),
              Text(widget.user.phone ?? ""),
            ],
          ),
          5.ph,
          Row(
            children: [
              const Text("Adres: "),
              Text(
                "${widget.user.address?.street}, ${widget.user.address?.suite}",
              )
            ],
          ),
          5.ph,
          Row(
            children: [
              const Text("Şehir: "),
              Text(widget.user.address?.city ?? ""),
            ],
          ),
          5.ph,
          Row(
            children: [
              const Text("Konum: "),
              Text(
                  "${widget.user.address?.geo?.lat}/${widget.user.address?.geo?.lng}"),
            ],
          ),
        ],
      ),
    ),
  );
}
