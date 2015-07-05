#include <irrlicht/irrlicht.h>
#include <irrlicht/driverChoice.h>
#include <iostream>
using namespace irr;
using namespace core;
using namespace scene;
using namespace video;
using namespace io;
using namespace gui;
int main()
{

irr::video::E_DRIVER_TYPE driverType;
driverType = video::EDT_OPENGL;

    // create device and exit if creation failed

    IrrlichtDevice *device =
        irr::createDevice(driverType, core::dimension2d<u32>(640, 480));

    if (device == 0)
        return 1; // could not create selected driver.

    video::IVideoDriver* driver = device->getVideoDriver();
    scene::ISceneManager* smgr = device->getSceneManager();

    device->getFileSystem()->addFileArchive("map-20kdm2.pk3");

    scene::IAnimatedMesh* mesh = smgr->getMesh("20kdm2.bsp");
    scene::ISceneNode* node = 0;


    if (mesh)
        node = smgr->addOctreeSceneNode(mesh->getMesh(0), 0, -1, 1024);

    if (node)
        node->setPosition(core::vector3df(-1300,-144,-1249));

    smgr->addCameraSceneNodeFPS();

    device->getCursorControl()->setVisible(false);

    int lastFPS = -1;

    while(device->run())
    {
        if (device->isWindowActive())
        {
            driver->beginScene(true, true, video::SColor(255,200,200,200));
            smgr->drawAll();
            driver->endScene();

            int fps = driver->getFPS();

            if (lastFPS != fps)
            {
                core::stringw str = L"Irrlicht Engine - Quake 3 Map example [";
                str += driver->getName();
                str += "] FPS:";
                str += fps;

                device->setWindowCaption(str.c_str());
                lastFPS = fps;
            }
        }
        else
            device->yield();
    }

    device->drop();
    return 0;

}
