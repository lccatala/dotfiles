Vim�UnDo� ��v�����f�*����H�� H���"���   V                                   a��     _�                              ����                                                                                                                                                                                                                                                                                                                                                             a��     �               U   %from __future__ import print_function   import argparse   	import os   import random   import torch   import torch.nn as nn   import torch.nn.parallel   $import torch.backends.cudnn as cudnn   import torch.optim as optim   import torch.utils.data   #import torchvision.datasets as dset   +import torchvision.transforms as transforms   "import torchvision.utils as vutils   import numpy as np   import matplotlib.pyplot as plt   (import matplotlib.animation as animation       if __name__ == '__main__':       )    # Set random seed for reproducibility       manualSeed = 999   H    #manualSeed = random.randint(1, 10000) # use if you want new results   &    print("Random Seed: ", manualSeed)       random.seed(manualSeed)   !    torch.manual_seed(manualSeed)            # Root directory for dataset       dataroot = "data/celeba"       &    # Number of workers for dataloader       workers = 2            # Batch size during training       batch_size = 128       I    # Spatial size of training images. All images will be resized to this   !    #   size using a transformer.       image_size = 64       K    # Number of channels in the training images. For color images this is 3   
    nc = 3       <    # Size of z latent vector (i.e. size of generator input)       nz = 100       '    # Size of feature maps in generator       ngf = 64       +    # Size of feature maps in discriminator       ndf = 64           # Number of training epochs       num_epochs = 5       "    # Learning rate for optimizers       lr = 0.0002       *    # Beta1 hyperparam for Adam optimizers       beta1 = 0.5       3    # Number of GPUs available. Use 0 for CPU mode.       ngpu = 1       B    # We can use an image folder dataset the way we have it setup.       # Create the dataset   -    dataset = dset.ImageFolder(root=dataroot,   =                               transform=transforms.Compose([   A                                   transforms.Resize(image_size),   E                                   transforms.CenterCrop(image_size),   9                                   transforms.ToTensor(),   Z                                   transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5)),   "                               ]))       # Create the dataloader   L    dataloader = torch.utils.data.DataLoader(dataset, batch_size=batch_size,   O                                             shuffle=True, num_workers=workers)       +    # Decide which device we want to run on   Z    device = torch.device("cuda:0" if (torch.cuda.is_available() and ngpu > 0) else "cpu")           # Plot some training images   '    real_batch = next(iter(dataloader))       plt.figure(figsize=(8,8))       plt.axis("off")        plt.title("Training Images")   v    plt.imshow(np.transpose(vutils.make_grid(real_batch[0].to(device)[:64], padding=2, normalize=True).cpu(),(1,2,0)))5�5��